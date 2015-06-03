"""Tools for traversing disk, discovering files, matching load program files to content (*.asc) files, and batching imports.

Intended to work primarily with an accompanying Django app, but functionality may be back-ported into here.
"""
import re, os, zipfile


path = os.path.abspath(__file__)
dir_path = os.path.dirname(path)
BUNDLED_LOADFILE_DIR = os.path.join(dir_path, 'data', 'loadfiles')


def discover(root_path=None, sources=None):
    """Looks for files in root_path (and below) that match various patterns supplied in sources. Returns a list of hits or None if no hits found.

    root_path: directory to look in for files; searches below automatically and defaults to bundled loadfiles if None
    sources: list containing dictionaries that specify str name and list patterns. Each value in patterns must be a regular expression representing a file naming convention.
    
    Here is an example of a source dictionary.
        
        {
        'name': 'HCUP SID CORE',
        'patterns': [
            '(?P<state_abbr>[A-Z]{2})_(?P<repository>SID|SIDC)_(?P<year>[0-9]{4})_(?:CORE)\.(?P<file_extension>(asc|zip|exe|sas))',
            ]
        }
    
    Each discovered hit will contain, at a minimum, filename, full_path, directory, data_source, and size_on_disk. Hits will also contain any other named captured values specified in the regular expression pattern that found them.
    """
    if root_path is None:
        #by default, uses loadfiles bundled with the PyHCUP package
        #why not set this as the default in the function definition above?
        #because it makes it look awful when using tab-assistance in a Python editor
        root_path = BUNDLED_LOADFILE_DIR
    
    if sources is None:
        #use default sources
        sources = [
            {
            'name': 'HCUP',
            'description': 'Healthcare Cost and Utilization Project',
            'content': 'contentnh_uncompressed', #this can be omitted, or be whatever you want. It's in by default because the author uses it elsewhere in his work.
            'patterns': [
                '(?P<state_abbr>[A-Z]{2})_(?P<file>[A-Z]+)_(?P<year>[0-9]{4})_(?P<category>[A-Z_]+)\.(?P<file_extension>asc)',
                ]
            },
            {
            'name': 'HCUP',
            'description': 'Healthcare Cost and Utilization Project',
            'content': 'contentnh_zipcompressed', #this can be omitted, or be whatever you want. It's in by default because the author uses it elsewhere in his work.
            'patterns': [
                '(?P<state_abbr>[A-Z]{2})_(?P<file>[A-Z]+)_(?P<year>[0-9]{4})_(?P<category>[A-Z_]+)\.(?P<file_extension>exe|zip)',
                ]
            },
            {
            'name': 'HCUP',
            'description': 'Healthcare Cost and Utilization Project',
            'content': 'load_uncompressed', #this can be omitted, or be whatever you want. It's in by default because the author uses it elsewhere in his work.
            'patterns': [
                '(?P<state_abbr>[A-Z]{2})_(?P<file>[A-Z]+)_(?P<year>[0-9]{4})_(?P<category>[A-Z_]+)\.(?P<file_extension>sas)',
                ],
            },
            {
            'name': 'PUDF',
            'description': 'Texas Inpatient Public Use Data File',
            'content': 'load_uncompressed', #this can be omitted, or be whatever you want. It's in by default because the author uses it elsewhere in his work.
            'patterns': [
                '(?P<state_abbr>tx)_(?P<file>pudf)_(?P<year>[0-9]{4})_(?P<category>base|charges|facility)_definition\.(?P<file_extension>txt)',
                ],
            },
            ]
    
    hits = []
    for directory, dirs, files in os.walk(root_path):
        #http://docs.python.org/2/library/os.html#os.walk
        
        #loop through files each time some are found
        for filename in files:
            
            #check file against possible sources by examining filename for known patterns
            for source in sources:
                for pattern in source['patterns']:
                    match = re.match(pattern, filename)
                    if match is not None:
                        full_path = os.path.join(directory, filename)
                        hit = {
                            'filename': filename,
                            'full_path': full_path,
                            'directory': directory,
                            'source': source['name'],
                            'size_on_disk': os.stat(full_path).st_size
                            }
                        hit.update(match.groupdict())
                        hits.append(hit)
    
    if len(hits) > 0:
        return hits
    else:
        return None


def openz(path, filename, target=None, target_ext='asc'):
    """Open a zipped (PKZIP) archive and return a file-like object from it. If target is None, any intuited match must have extension target_ext.
    
    If target is None, search for a file in archive matching the passed filename, including variants of SID/SIDC. These searches are case sensitive.
    
    If no such match, check to see if only one file and use that.
    """
    with zipfile.ZipFile(os.path.join(path, filename)) as z:
        if target is None:
            matched = False
            for zname in z.namelist():
                
                if not matched:
                    # check for exact matches, using target file extension
                    extended_filename = '.'.join(filename.split('.')[:-1]) + '.' + target_ext
                    
                    # check for SID/SIDC variants
                    variant = extended_filename.replace('_SIDC_', '_SID_')
                    
                    if (zname == extended_filename
                        or zname == variant):
                        #found an exact match
                        target = zname
                        matched = True
            
            if not matched:
                #still not matched
                #last chance is to check to see if the length of the filenames is one, and just use that one
                if len(z.namelist()) == 1:
                    target = z.namelist()[0]
                else:
                    raise Exception("Unable to determine target file in archive %s. Contents are %s." % (os.path.join(path, filename), ', '.join(z.namelist())))
        
        handle = z.open(target)
        return handle


def filetostr(target, preserve_newlines=False):
    joined = ''.join([x for x in open(target)])
    if preserve_newlines:
        return joined
    else:
        return joined.replace('\n', '')


def file_length(target):
    """Reads through a target file and determines its length. Useful for determining whether to chunk large files for actual data loading.
    
    Can still take a while for large files, though this code attempts to minimize required overhead.
    """
    with open(target) as h:
        lines = sum(1 for line in h)
    return lines
"""Tools for processing a SAS loadfile (.sas) and a corresponding flat ASCII datafile (fixed-width .asc or .txt).

Originally developed to parse HCUP State Inpatient Database ASCII files (http://www.hcup-us.ahrq.gov/sidoverview.jsp). Untested with other data sources.

Requires pandas (pandas.pydata.org)"""
import re
import pandas as pd


def meta_from_sas(target):
    """Parses target SAS loadfile and builds a pandas DataFrame object with meta data.
    """
    #concatenate loadfile lines and remove newline characters
    concatenated = ''.join([x for x in open(target)])
    concatenated.replace('\n', '')
    
    #more than one way for this to be stored in a SAS loading program
    description_patterns = ['((?P<field>\S+)\s+LENGTH=\$?(?:\d+)\s*(FORMAT=(?P<format>\S*))?\s*LABEL=\s*"(?P<label>[^"]+)")',
                            '(?P<field>\S+)\s*=\'(?P<label>[^\']*)\'',
                            #the capture group for length is taken out as it isn't used anyways
                            #preserved here in case this turns out later to be a boo-boo
                            #'((?P<field>\S+)\s+LENGTH=\$?(?<length>\d+)\s*(FORMAT=(?P<format>\S*))?\s*LABEL=\s*"(?P<label>[^"]+)")',
                           ]
    description_regex = None
    for description_pattern_candidate in description_patterns:
        if description_regex is None:
            #check for matches
            description_regex_candidate = re.compile(description_pattern_candidate)
            #set description_regex to compiled pattern if found in file
            if re.search(description_regex_candidate, concatenated):
                description_regex = re.compile(description_pattern_candidate)
    
    if description_regex == None:
        raise Exception('Unable to find suitable description regex pattern for file.')
            
    assignment_regex = re.compile('(@(?P<position>\d+)\s+(?P<field>\w+)\s+(?P<informat>\S+))')#works with legacy formats
    line_width_regex = re.compile('(LRECL = (?P<line_width>\d+))')
    
    #this is not used, but may be implemented in later for non-HCUP missing values parsing
    #missing_val_regex = re.compile('(INVALUE\s{1}(?P<informat_class>\w+)(?P<informat_map>\s+(\S+ = \S+))+)')
    
    #use variable attribute section mostly to pull descriptive column headings
    fields_from_var_att = [x.groupdict() for x in re.finditer(description_regex, concatenated)]
    v_df = pd.DataFrame(fields_from_var_att)
    
    #use input section for starting positions and bulk of format info
    fields_from_input = [x.groupdict() for x in re.finditer(assignment_regex, concatenated)]
    i_df = pd.DataFrame(fields_from_input)
    
    #merge meta information from each section of the sas loadfile
    #if 'length' in v_df.columns:
    #    v_df.drop('length', axis=1, inplace=True)
    meta_df = i_df.merge(v_df, on='field',
                         suffixes=('_input_section', '_var_section'))
    
    #get most of the column widths using the difference between start positions
    #but exclude any width determination for the final column, since we don't have a right-side bound
    starts = [int(x) for x in meta_df['position']]
    widths = [starts[key+1] - value for key, value in enumerate(starts) if key+1<len(starts)]
    
    #determine and append the final column width using the final start position and the total line width
    #this trusts the LRECL value in the loadfile rather than verifying the width of a line in a datafile
    #also another quirk worth noting is that although SAS calls the first column 1, the LRECL value
    #is based on starting at 0 (correctly)
    lw_search = re.search(line_width_regex, concatenated)
    if lw_search:
        line_width = int(lw_search.groups()[1])
    else:
        raise Exception('Unable to find line width (logical record length aka LRECL) in specified target')
    widths.append(line_width + 1 - starts[-1])
    
    #add widths back to the dataframe
    meta_df['width'] = widths
    
    return meta_df


def meta_augment(meta_df):
    """Uses informat data pulled from SAS loadfile to derive additional information about columns
    
    Returns: processed meta dataframe.
    """
    
    #avoid a circular reference
    from pyhcup.db import col_from_invalue

    meta_df['length'] = meta_df['informat'].map(lambda x: col_from_invalue(x)['length'])
    meta_df['data_type'] = meta_df['informat'].map(lambda x: col_from_invalue(x)['type'])
    meta_df['scale'] = meta_df['informat'].map(lambda x: col_from_invalue(x)['scale'])
    meta_df['numeric_or_int'] = meta_df['data_type'].map(lambda x: True if x in ['int', 'numeric'] else False)
    return meta_df


def df_from_sas(target, meta_df, skiprows=None, nrows=None, chunksize=None):
    """Deprecated. Use pyhcup.parser.read()"""
    print "WARNING: pyhcup.sas.df_from_sas() is deprecated and is scheduled for removal in pyhcup 0.1.6; use pyhcup.parser.read()"
    
    from pyhcup.parser import read
    result = read(target, meta_df, skiprows=skiprows, nrows=nrows, chunksize=chunksize)    
    return result

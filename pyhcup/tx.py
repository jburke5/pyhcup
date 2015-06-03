"""Tools for processing Texas PUDF in conjunction with HCUP data

Texas does not participate in HCUP, but does provide instead its own Inpatient Public Use Data Files (PUDF) for similar purposes.

More information on Texas Inpatient PUDF at http://www.dshs.state.tx.us/thcic/hospitals/Inpatientpudf.shtm.
"""
import os, re


def meta_from_txt(target):
    """Parses target text file containing Texas PUDF metadata and builds a pandas DataFrame object.
    """
    pattern = '(?P<field_number>\d+\w?)\s+(?P<field>\S+)\s+(?:(?P<label>.*?)\s*)(?P<position>\d+)\s+(?P<width>\d+)\s+(?P<data_type>\w+)'

    joined = ' '.join([x for x in open(target)])
    captured = [x.groupdict() for x in re.finditer(pattern, joined)]

    #avoid circular imports
    from pandas import DataFrame
    
    meta = DataFrame(captured)
    if len(meta[ meta.field == 'SPEC_UNIT_1' ]) == 1:
        #we have individual spec unit cols, so drop any combined one
        #otherwise this throws off the parsing of the real files
        meta = meta[ meta.field != 'SPEC_UNIT' ]
    
    # Occasionally there's a cute field with a hyphen in it. This breaks SQL since it's a disallowed character for SQL object names due to ambiguity with the subtraction operator.
    meta.field = meta.field.map(lambda x: x.replace('-', '_'))

    return meta


def get_meta(year, variety='base', split_base_portion=None):
    """Retrieves a meta DataFrame object for a given year of Texas PUDF data
    
    split_base_portion should only be used for 2011 and 2012 base years, which are split into two chunks by Texas
    """

    year = int(year)#sometimes this is passed a string and I'd rather it work anyways
    varieties = ['base', 'charges', 'facility']
    years = xrange(1999, 2013)

    assert variety.lower() in varieties, "No Texas PUDF definitions available for variety %s" % variety
    assert year in years, "No Texas PUDF definitions available for year %s" % year
    
    if not (year > 2010 and variety.lower == 'base'):
        filename = 'tx_pudf_%d_%s_definition.txt' % (year, variety.lower())
    else:
        assert split_base_portion in [1, 2], "For 2011 and 2012 base files, must specify which portion (1 or 2)"
        filename = 'tx_pudf_%d_%s_definition_%d.txt' % (year, variety.lower(), split_base_portion)
    
    from pyhcup.hachoir import BUNDLED_LOADFILE_DIR
    target = os.path.join(BUNDLED_LOADFILE_DIR, 'tx_pudf', filename)
    
    return meta_from_txt(target)


def meta_augment(meta_df):
    """Akin to sas.meta_augment(), but for use with meta derived from Texas Inpatient Public Use Data Files.
    """
    meta_df['length'] = meta_df['width']
    meta_df['scale'] = meta_df['field'].map(lambda x: 2 if x.find('CHARGES') > -1 or x.find('AMOUNT') > -1 else 0)
    return meta_df

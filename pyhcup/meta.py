"""Functions for getting and working with meta data

"High-level" module which imports other pyhcup modules as part of its work
"""
import hachoir
import sas
import tx
from parser import LONG_MAPS

import pandas as pd

def get(state, year, category=None, datafile=None):
    """Builds requested meta DataFrame using packaged data
    
    Note that this is not terribly efficient as it relies on crawling the loadfile directory each time it is called.
    
    datafile is optional and will be overwritten for Texas PUDF requests
    """
    
    #by default, hachoir.discover() is pointed at the bundled loadfiles
    available_loadfiles = hachoir.discover()
    
    #for all requested states _except_ for Texas or TX, look for an HCUP file
    if state.lower() in ['texas', 'tx']:
        source = 'pudf'
        datafile = 'pudf'
        if category == None:
            category = 'base'
    else:
        source = 'hcup'
        if category == None:
            category = 'CORE'
        
        if datafile == None:
            datafile = 'SID'

    match = None    
    for lf in available_loadfiles:
        if match is None:
            if (
                lf['source'].lower() == source and
                lf['file'].lower() == datafile.lower() and
                lf['state_abbr'].lower() == state.lower() and
                lf['category'].lower() == category.lower() and
                lf['year'] == str(year) # cuz the regex will have found year as a string
                ):
                match = lf['full_path']
                if source == 'pudf':
                    #use tx functions to make the meta DataFrame
                    result_meta_df = tx.meta_from_txt(match)
                else:
                    result_meta_df = sas.meta_from_sas(match)
    
    if match is None:
        raise Exception("No loadfile found matching state %s, year %s, category %s, and datafile %s" % (state, year, category, datafile))

    return result_meta_df


def augment(meta_df, dialect='HCUP'):
    """Augments meta data in meta_df, typically to prepare for SQL table creation.
    
    By default, expects meta_df to have been built from an HCUP SAS loadfile and uses corresponding augmentation functionality. Can instead specify dialect='PUDF' for meta built from Texas Inpatient Public Use Data Files.
    """
    if dialect.lower() == 'hcup':
        return sas.meta_augment(meta_df)
    
    elif dialect.lower() == 'pudf':
        return tx.meta_augment(meta_df)


def merge(meta_df_list):
    """Turn a list of (pre-augmented) meta DataFrames into an unduplicated set
    """
    merged_meta = pd.concat(meta_df_list).reset_index()
    
    #sort_index using length before de-duplication. This will ensure that the longest value is used.
    msorted = merged_meta.sort_index(by=['field','length'], ascending=False)
    mdedup = msorted.drop_duplicates(cols='field')
    
    #must not end up with a different number of fields vs the count of unique fields in the original merge
    assert len(mdedup) == len(merged_meta.field.unique()), "De-duplicated column count (%d) does not match count of unique fields among original meta_df_list (%d)" % (len(mdedup), len(merged_meta.field.unique()))
    
    return mdedup


def is_long(meta_df, category='CHGS'):
    # first check to see whether the indicated category even exists in LONG_MAPS
    if category in LONG_MAPS.keys():
        # proceed
        
        ALLOWABLE_EXTRA_COLS = ['KEY', 'CPTHCPCS', 'CPTMOD1', 'CPTMOD2']
        
        if all([v.upper() in LONG_MAPS[category].keys() or v.upper() in ALLOWABLE_EXTRA_COLS
                for v in meta_df.field.values]):
            return True
        else:
            return False
    else:
        raise Exception("The requested category (%s) is not a valid LONG_MAPS entry; options are %s" % (category, ', '.join(LONG_MAPS.keys())))

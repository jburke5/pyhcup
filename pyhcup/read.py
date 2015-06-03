"""Read in data from HCUP (and Texas PUDF)
"""
def read(target, meta_df=None, state=None, year=None, variety=None,
         skiprows=None, nrows=None, chunksize=None, dtype=str, **kwargs):
    """Read in target data file. Uses supplied meta_df or infers from state, year, variety. In addition to built-in options, can pass any extra arguments understood by pd.read_fwf by using **kwargs.
    
    Returns a pandas DataFrame object containing the parsed data if chunksize is None, otherwise returns a reader generating chunksize chunks with each iteration.
    
    target -> required
        1. full path to a data file (including filename); or
        2. a file-like Python object (e.g. handler)
    
    meta_df -> optional
        may be a pandas DataFrame object containing meta data (width and field)
    
    Can optionally specify rows to skip (skiprows) or limit the number of rows to read (nrows).
    """
    import pandas as pd
    from pyhcup import meta
    
    if meta_df is not None:
        assert type(meta_df) is pd.DataFrame, "If used, meta_df must be a pandas DataFrame object"
        assert 'width' in meta_df.columns, "meta_df DataFrame must contain a column 'width'"
        assert 'field' in meta_df.columns, "meta_df DataFrame must contain a column 'field'"
    else:
        #need to try to look up a load file
        assert type(state) is str, "state must be a string if not supplying meta"
        assert type(year) is str or type(year) is int, "year must be a string or integer if not supplying meta"
        assert type(variety) is str, "variety must be a string if not supplying meta"
        meta_df = meta.get(state, year, variety)
    
    widths = [int(x) for x in meta_df.width]
    names = [x for x in meta_df.field]
    converters = {x: dtype for x in names} # would prefer to be using dtype=str with pd.read_fwf(), but it is not supported
    
    result = pd.read_fwf(target, header=None, widths=widths, names=names,
                         nrows=nrows, skiprows=skiprows, converters=converters,
                         chunksize=chunksize, **kwargs)
    return result

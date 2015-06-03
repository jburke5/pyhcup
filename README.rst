PyHCUP is a Python library for parsing and importing data obtained from the United States Healthcare Cost and Utilization Program (http://hcup-us.ahrq.gov).

About
================================================

Data from HCUP come as a text file, with each column a specific width. However, the widths of these columns, and their names, are elsewhere. HCUP provide this meta data as either SAS or SPSS data loading programs.

PyHCUP is built to extract meta data from the SAS loading programs, then use that meta data to parse the actual data in the fixed-width text files. You'll still need to acquire the actual data through HCUP.

A more verbose set of instructions is available in a series of posts on the author's blog at http://bielism.blogspot.com/2013/12/hcup-and-python-pt-i-background.html.

Example Usage
================================================

Load a datafile/loadfile combination.
------------------------------------------------

::

    import pyhcup
 
    # specify where your data and loadfiles live
    datafile = 'D:\\Users\\hcup\\sid\\NY_SID_2009_CORE.asc'
    loadfile = 'D:\\Users\\hcup\\sid\\sasload\\NY_SID_2009_CORE.sas'
 
    # pull basic meta from SAS loadfile
    meta_df = pyhcup.meta_from_sas(loadfile)
    
    # use meta knowledge to parse datafile into a pandas DataFrame
    df = pyhcup.read(datafile, meta_df)
    
    # that's it. use df from here.

Deal with very large files that cannot be held in memory in two ways.

1) To import a subset of rows, such as for preliminary work or troubleshooting, specify nrows to read and/or skiprows to skip using sas.df_from_sas().

::

    # optionally specify nrows and/or skiprows to handle larger files
    df = pyhcup.read(datafile, meta_df, nrows=500000, skiprows=1000000)

2) To iterate through chunks of rows, such as for importing into a database, first use the metadata to build lists of column names and widths. Next, pass a chunksize to the read() function above to create a generator yielding manageable-sized chunks.

::

    chunk_size = 500000
    reader = pyhcup.read(datafile, meta_df, chunksize=chunk_size)
    for df in reader:
        # do your business
        # such as replacing sentinel values (below)
        # or inserting into a database with another Python library

Whether you are pulling in all records or just a chunk of records, you can also replace all those pesky missing/invalid data placeholders from HCUP (this is less useful for generically parsing missing values for non-HCUP files).

::

    # fyi, this bulldozes through all values in all columns with no per-column control
    replaced = pyhcup.replace_sentinels(df)


Shortcut to loadfiles (meta data)
------------------------------------------------

The SAS loading program files provided by HCUP for the State Inpatient Database (SID), State Ambulatory Surgery Database (SASD), and State Emergency Department Database (SEDD) are bundled in this package for easy access. You can retrieve the meta data for these directly, without having to specify a loadfile path as described above.

Acquire meta in this way using the get_meta() function. You must pass a state abbreviation as the first argument and a year as the second arugment, like so.

::

    meta_df = pyhcup.get_meta('NY', 2009)

By default, get_meta() acquires SID CORE data. Other meta can be acquired with the optional keyword arguments datafile ('SID', 'SEDD', or 'SASD') and category ('CORE', 'CHGS', 'SEVERITY', 'DX_PR_GRPS', or 'AHAL').

::

    # California emergency department charges meta for 2010
    ca_2010_emergency_charges_meta = pyhcup.get_meta('CA', 2010, datafile='SEDD', category='CHGS')
    
    # Arizona outpatient surgery DRG records meta for 2004
    az_2004_surg_groups_meta = pyhcup.get_meta('AZ', 2004, datafile='SASD', category='DX_PR_GRPS'
    
    # etc.
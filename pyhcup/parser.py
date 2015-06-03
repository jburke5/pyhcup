"""Read in and process data from HCUP (and Texas PUDF)
"""
import re
import os
import numpy
import pandas as pd
from pandas import DataFrame

# save a little overhead on dispatch for these later
na_value = numpy.NaN
re_match = re.match



"""Lots of local config stuff"""
# pathing information to reach bundled utilization flag definitions
path = os.path.abspath(__file__)
dir_path = os.path.dirname(path)
BUNDLED_UFLAGDEF = os.path.join(dir_path, 'data', 'uflags', 'uflag_definitions.csv')


# Some files have bonus content, which should be skipped for loading
SKIP_ROWS = {
        ('SID', 'AR', 2010, 'AHAL'): 2,
        ('SID', 'AR', 2010, 'CHGS'): 2,
        ('SID', 'AR', 2010, 'CORE'): 2,
        ('SID', 'AR', 2010, 'DX_PR_GRPS'): 2,
        ('SID', 'AR', 2010, 'SEVERITY'): 2,
        ('SID', 'AR', 2011, 'AHAL'): 2,
        ('SID', 'AR', 2011, 'CHGS'): 2,
        ('SID', 'AR', 2011, 'CORE'): 2,
        ('SID', 'AR', 2011, 'DX_PR_GRPS'): 2,
        ('SID', 'AR', 2011, 'SEVERITY'): 2,
    }


# definitions for replacing missing values down the line
MISSING_PATTERNS = {
        'missing':        '-9*\.?9*[^-\.]| |\.',
        'invalid':        '-8*\.?8*[^-\.]|A',
        'unavailable':    '-7*\.?7*[^-\.]',
        'inconsistent':   '-6*\.?6*[^-\.]',
        'notapplicable':  '-5*\.?5*[^-\.]',
        'tx_cell_too_sm': '-?999+8',
        'tx_invalid':     '\*',
        'tx_missing':     '\.|`',
        }

# pre-compile for later use, or for accessing this via dot notation
# e.g. from pyhcup.parser import COMPILED_MISSING_PATTERNS
COMPILED_MISSING_PATTERNS = re.compile('^%s$' % '|'.join(MISSING_PATTERNS.values()))


# configuration of maps for converting wide to long
# TODO: these should probably be made into actual objects of some kind
# given especially that later on down the line db.long_table_sql() has
# config-y stuff in it that might be useful outside of that function alone
LONG_MAPS = {
    'CHGS': {
        'CHARGE': ['CHG', 'REVCHG', 'CHRGS_LINE_ITEM'],
        'RATE': ['RATE', 'UNIT_RATE'],
        'REVCODE': ['REVCD', 'REVENUE_CODE'],
        'UNITS': ['UNIT', 'UNITS_OF_SERVICE'],
    },
    'DX': {
        'DX': ['DX'],
        'DXCCS': ['DXCCS'],
        'DXPOA': ['DXPOA'],
        'DXV': ['DXV'],
        # WARNING: DxatAdmit and TMDX need to be consolidated into DXPOA.
        # This will require a mapping definition, which should probably be written
        # into PyHCUP given the huge pile of data that will be affected.
        # alternatively, these could stay in their own columns in a long table
        # definition and be accessed intelligently (!) from there.
        'DXatAdmit': ['DXatAdmit'],
        'TMDX': ['TMDX'],
        
    },
    'PR': {
        'PR': ['PR'],
        'PRCCS': ['PRCCS'],
        'PRDATE': ['PRDATE'],
        'PRDAY': ['PRDAY'],
        'PRMONTH': ['PRMONTH'],
        'PRYEAR': ['PRYEAR'],
        'PRMCCS': ['PRMCCS'],
        'PRV': ['PRV'],
        'PCLASS': ['PCLASS'],
    },
}


def lm_reverse(category, entry):
    """
    Finds the matching "column" for a given entry value, where
    entry is a string that appears in a long map list of possible
    columns.
    """
    lm = LONG_MAPS
    
    matched = False
    for col, candidates in lm[category].iteritems():
        if matched == False:
        
            if (
                entry.lower() == col.lower() or # matches straight-up
                entry.lower() in [x.lower() for x in candidates]
                ):
                matched = True
                match = col
    
    if matched:
        return match
    else:
        return False

def _open(full_path, state, year, variety, database='SID'):
    """Returns a handle using python's builtin open() function; however, it
    will skip past any non-content rows as specified within.
    
    This is necessary because HCUP files very occasionally have bonus
    content, typically a data use notice, and it mucks up parsing.
    """
    
    handle = open(full_path)
    
    # kludgy workaround for None values passed to _open()
    if state is None:
        state = ''
    
    if year is None:
        year = 0
    
    if variety is None:
        variety = ''
    
    screen = (str(database).upper(), str(state).upper(), int(year), str(variety).upper())
    
    if screen in SKIP_ROWS:
        skipped = [handle.readline() for x in xrange(SKIP_ROWS[screen])]
    
    return handle


def read(target, meta_df=None, state=None, year=None, variety=None,
         skiprows=None, nrows=None, chunksize=None):
    """Read in target data file. Uses supplied meta_df or infers from state, year, variety.
    
    Returns a pandas DataFrame object containing the parsed data if chunksize is None, otherwise returns a reader generating chunksize chunks with each iteration.
    
    target -> required
        Must be the full path to a data file
    
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
    
    handle = _open(target, state, year, variety)
    
    result = pd.read_fwf(target, header=None, widths=widths, names=names,
                         nrows=nrows, skiprows=skiprows, chunksize=chunksize)
    return result


def replace_sentinels(df, extra_dict=None):
    """Replaces sentinel patterns and values for bad data
    
    HCUP definitions from http://www.hcup-us.ahrq.gov/db/coding.pdf
    TX PUDF definitions from individual year manuals http://www.dshs.state.tx.us/thcic/hospitals/Inpatientpudf.shtm
    """
    
    df = df.applymap(
        lambda x: na_value if re_match(COMPILED_MISSING_PATTERNS, str(x)) is not None else x
        )
    return df


def replace_df_placeholders(df, extra_dict=None):
    dictionary = {'Y': 1, 'N': 0}
    if extra_dict is not None:
        dictionary.update(extra_dict)
        
    df = df.applymap(lambda x: dictionary.get(x) if x in dictionary else x)
    return df


class UtilizationFlagger:
    def __init__(self, uflag_name, revcodes=None, chg_group=None, pr=None, prccs=None):
        """Object holding a definition for a utilization flag. Can also apply the definition to a set of charges and procedures data in order to determine the appropriate value for the utilization flag. Must specify at least one of revcodes, pr, and prccs.
        
        Parameters
        revcodes: list (optional)
            Contains a list of UB92/UB04 revenue codes associated with the utilitzation flag.
        
        chg_group: list (optional)
            Contains a list of charge group numbers, for state-years with charge buckets rather than per-revenue code charges. These will correspond to the n in CHGn in the source files.
            
            WARNING: If revcodes is set, chg_group is ignored.
        
        pr: list (optional)
            Contains a list of ICD-9-CM procedure codes associated with the utilitzation flag.
        
        prccs: list (optional)
            Contains a list of Clinical Classification Software (CCS) procedure codes associated with the utilization flag.
        """
        # save passed parameters
        self.name = uflag_name
        self.revcodes = revcodes
        self.chg_group = chg_group
        self.pr = pr
        self.prccs = prccs
        
        # validation of passed parameters
        if (
            not isinstance(prccs, list) and
            not isinstance(chg_group, list) and
            not isinstance(revcodes, list) and
            not isinstance(pr, list)
            ):
            raise Exception("At least one of revcodes, chg_group, pr, and prccs must be a list")
        
        if not isinstance(uflag_name, str):
            raise Exception("uflag_name must be a string (got %s)" % type(uflag_name))
        
        for v in ['revcodes', 'chg_group', 'pr', 'prccs']:
            a = getattr(self, v)
            if a is not None and not isinstance(a, list):
                raise Exception("%s must be None or a list" % v)
            elif isinstance(a, list):
                # set an internal attribute version with left-filled versions included
                setattr(self, '_' + v, [str(i).zfill(4) for i in a if str(i).zfill(4) not in [str(j) for j in a]] + [str(i) for i in a])
            else:
                setattr(self, '_' + v, None)
    
    
    def sql(self, tbl_out, tbl_core, tbl_pr, tbl_charges, state='', year='NULL'):
        """Generates a SQL statement for generating values for this selflag within a database.
        
        If provided, state should be a string and year should be an integer or the string literal 'NULL'.
        """
        sel_cols = ['t_core.key']
        
        # revcode part
        if self._revcodes is not None:
            # have some revcodes to check for
            rev_clause = """
            CASE WHEN (
                SUM(CASE WHEN t_revcode.revcode IN ({cs_revcodes}) AND t_revcode.CHARGE > 0 THEN 1 ELSE 0 END)
                ) > 0
                THEN true
                ELSE false
                END AS has_revcode
            """.format(cs_revcodes=', '.join("'%s'" % x for x in self._revcodes))
        elif self._chg_group is not None:
            # no revcodes, but we do have charge group_number values to check for
            rev_clause = """
            CASE WHEN (
                SUM(CASE WHEN t_revcode.group_number IN ({cs_chg_group}) AND t_revcode.CHARGE > 0 THEN 1 ELSE 0 END)
                ) > 0
                THEN true
                ELSE false
                END AS has_revcode
            """.format(cs_chg_group=', '.join("'%s'" % x for x in self._chg_group))
        else:
            rev_clause = """
            false AS has_revcode
            """
        
        sel_cols.append(rev_clause)
        
        # prcode part
        if self._pr is not None and self._prccs is not None:
            # have both cpt pr codes and also ccs pr codes
            pr_clause = """
            CASE WHEN (
                SUM(CASE WHEN t_pr.pr IN ({cs_prcodes}) OR t_pr.prccs IN ({cs_prccscodes}) THEN 1 ELSE 0 END)
                ) > 0
                THEN true
                ELSE false
                END AS has_prcode
            """.format(cs_prcodes=', '.join("'%s'" % x for x in self._pr),
                       cs_prccscodes=', '.join("'%s'" % x for x in self._prccs))
        elif self._pr is not None:
            # have only cpt pr codes
            pr_clause = """
            CASE WHEN (
                SUM(CASE WHEN t_pr.pr IN ({cs_prcodes}) THEN 1 ELSE 0 END)
                ) > 0
                THEN true
                ELSE false
                END AS has_prcode
            """.format(cs_prcodes=', '.join("'%s'" % x for x in self._pr))
        elif self._prccs is not None:
            # have only ccs pr codes
            pr_clause = """
            CASE WHEN (
                SUM(CASE WHEN t_pr.prccs IN ({cs_prccscodes}) THEN 1 ELSE 0 END)
                ) > 0
                THEN true
                ELSE false
                END AS has_prcode
            """.format(cs_prccscodes=', '.join("'%s'" % x for x in self._prccs))
        else:
            # have neither!
            pr_clause = """
            false AS has_prcode
            """
        
        sel_cols.append(pr_clause)
        
        selflag_sql = """
            SELECT {cs_sel_clauses}, {state} AS state, {year} AS year
              FROM {tbl_core} AS t_core
              LEFT JOIN {tbl_charges} AS t_revcode
                ON t_core.key = t_revcode.key
              LEFT JOIN {tbl_pr} AS t_pr
                ON t_core.key = t_pr.key
              GROUP BY t_core.key
            """.format(cs_sel_clauses=",\t".join(sel_cols),
                       tbl_core=tbl_core,
                       tbl_charges=tbl_charges,
                       tbl_pr=tbl_pr,
                       state=state,
                       year=year
                       )
        
        full_sql = """
            WITH summary AS ({subq})
            INSERT INTO {tbl_out} (key, name, value)
            (SELECT key,
            '{selflag_name}' AS selflag_name,
            CASE
                WHEN has_revcode AND has_prcode THEN 3
                WHEN has_prcode THEN 2
                WHEN has_revcode THEN 1
                ELSE 0
            END AS selflag_value
            FROM summary);
            """.format(subq=selflag_sql, selflag_name=self.name, tbl_out=tbl_out)
        
        return full_sql
    
    
    def __repr__(self):
        return "<UtilizationFlagger: %s>" % self.name
    
    
    def apply(self, record_id, chgs_df, pr_df):
        """Searches procedures and charges to determine whether the indicated record_id should have this particular utilization flag. Returns the appropriate value based on HCUP flag coding conventions.
        
        Parameters

        pr_df: pandas DataFrame, required
            Procedure data in long format (indexed on KEY, data are ICD-9 codes in column PR and CCS codes in column PRCCS)

        chgs_df: pandas DataFrame, required
            Charges data in long format (indexed on KEY, data are UB92/UB04 codes in column REVCODE [and dollar amounts in CHARGE?])
        
        Return values:
            0: Neither procedures nor charges support this flag.
            1: Charges support this flag, but procedures do not.*
            2: Procedures support this flag, but charges do not.*
            3: Both charges and procedures suppor this flag.

            *N.B. that this does not mean that contradictory information is present, only that one category of information lacks positive evidence in support of the utilization flag.
        """
        
        # default values
        flag = 0
        chgs_match = False
        pr_match = False

        if chgs_df is not None and record_id in chgs_df.index.values:
            # some charges exist for this record_id
            # search them
            
            chgs_search = chgs_df.ix[record_id]
            
            # a hack because index searches return Series for single matches
            if isinstance(chgs_search, pd.Series):
                chgs_search = DataFrame(chgs_search).T
            
            check_match = chgs_search[ chgs_search.REVCODE.isin(self._revcodes) ]
            #print "REVCODE in %s: %s time(s)" % (self._revcodes, len(check_match))
            if len(check_match) > 0:
                chgs_match = True
        
        if pr_df is not None and record_id in pr_df.index.values:
            # some procedures exist for this record_id
            # search them

            pr_search = pr_df.ix[record_id]
            
            # a hack because index searches return Series for single matches
            if isinstance(pr_search, pd.Series):
                #print "Got a Series object for searched procedures"
                #print pr_search
                
                pr_search = DataFrame(pr_search).T
                #print "converted procedures:"
                #print pr_search
            
            if pr_match == False: # only search codes if haven't found a match yet
                check_match = pr_search[ pr_search.PR.isin(self._pr) ]
                #print "PR in %s: %s time(s)" % (self._pr, len(check_match))
                if len(check_match) > 0:
                    pr_match = True

            if pr_match == False: # only search codes if haven't found a match yet
                check_match = pr_search[ pr_search.PRCCS.isin(self._prccs) ]
                #print "PRCCS in %s: %s time(s)" % (self._prccs, len(check_match))
                if len(check_match) > 0:
                    pr_match = True
        
        if chgs_match is True:
            if pr_match is True:
                flag = 3
            else:
                flag = 1
        elif pr_match is True:
            flag = 2
        else:
            flag = 0
       
        return flag


def default_uflaggers(state=None, year=None):
    """Creates a list of UtilizationFlagger objects using the default utilization flag definitions bundled in PyHCUP
    
    The state and year parameters are optional, and can be passed to request special case uflag definitions. Generally these apply only to state-years that provide aggregate charge groups or "buckets," rather than detailed charges.
    
    If both state and year are passed, the bundled uflag definitions will be checked for a special column that applies. Any additional state-years added to the csv will require code in this class function as well.
    """
    definitions = pd.read_csv(BUNDLED_UFLAGDEF)
    
    flaggers = []
    for k, d in definitions.iterrows():
        
        if pd.isnull(d['pr']):
            pr = None
        else:
            pr = d['pr'].split(';')
        
        if pd.isnull(d['prccs']):
            prccs = None
        else:
            prccs = d['prccs'].split(';')
        
        if state is not None:
            s_up = state.upper()
        else:
            s_up = None
        
        if s_up == 'AZ':
            # Arizona special snowflakes
            if year > 2007 and not pd.isnull(d['chgn_az_gt_2007']):
                chg_group = d['chgn_az_gt_2007'].split(';')
            elif year > 1994 and not pd.isnull(d['chgn_az_gt_1994']):
                chg_group = d['chgn_az_gt_1994'].split(';')
            else:
                chg_group = None
        
        elif s_up == 'FL':
            # Branch Floridians
            if year > 2009 and not pd.isnull(d['chgn_fl_gt_2009']):
                chg_group = d['chgn_fl_gt_2009'].split(';')
            elif year > 2006 and not pd.isnull(d['chgn_fl_gt_2006']):
                chg_group = d['chgn_fl_gt_2006'].split(';')
            elif year > 1991 and not pd.isnull(d['chgn_fl_gt_1991']):
                chg_group = d['chgn_fl_gt_1991'].split(';')
            else:
                chg_group = None
        
        elif s_up == 'RI':
            # Colossal
            chg_group = d['chgn_ri'].split(';')
        
        elif s_up == 'SC':
            # Branch Floridians
            if year > 1995 and not pd.isnull(d['chgn_sc_gt_1995']):
                chg_group = d['chgn_sc_gt_1995'].split(';')
            else:
                chg_group = None
        
        elif s_up == 'SD' and not pd.isnull(d['chgn_sd']):
            # The one with Mount Rushmore
            chg_group = d['chgn_sd'].split(';')
            
        else:
            chg_group = None
        
        if pd.isnull(d['revcodes']) or chg_group is not None:
            # set revcodes to None if chg_group is not None
            r = None
        else:
            r = d['revcodes'].split(';')
            
        
        
        f = UtilizationFlagger(d['name'], revcodes=r, chg_group=chg_group, pr=pr, prccs=prccs)
        flaggers.append(f)
    
    return flaggers


def parse_wide_label(wide_label, category='CHGS'):
    """Breaks a wide format column label from a charges record into its component pieces.
    """
    
    if category in LONG_MAPS.keys():
        long_map = LONG_MAPS[category]
    else:
        raise Exception("parse_wide_label() was called with category %s, but that category does not exist in LONG_MAPS (valid values are %s)" % (category, LONG_MAPS.keys()))
    
    type_re_pattern='(?P<type>\D+){1}(?P<num>\d+)?'
    match = re.match(type_re_pattern, wide_label)
    wide_type = match.group('type')
    match_num = match.group('num')
    
    converted_type = None
    for long_column, constructions in long_map.iteritems():
        if wide_type in constructions:
            converted_type = long_column
            return {'wide_label': wide_label,
                    'converted_type': converted_type,
                    'wide_type': wide_type,
                    'match_num': match_num,
                    }
    
    if converted_type is None:
        pass


def row_wtl(row, category='CHGS'):
    """Convert wide records to long

    row must be a dictionary with key/value pairs describing things like charges, diagnoses, or procedures.

    E.g.
        {
        'CHG1': 152.25,
        'RATE1': 790.0,
        'REVCD1': 128,
        ... ,
        'REVCD10': 278,
        }
    """
    longs = []
    key_labels = []
    

    if category in LONG_MAPS:
        long_map = LONG_MAPS[category]
    else:
        raise Exception("parse_wide_label() was called with category %s, but that category does not exist in LONG_MAPS (valid values are %s)" % (category, LONG_MAPS.keys()))    
    
    if category == 'CHGS':
        key_conv_type = 'CHARGE'
    else:
        key_conv_type = category
    
    for wide_label, value in row.iteritems():
        #one pass to get the charge labels
        parsed = parse_wide_label(wide_label, category)
        if parsed is not None and parsed['converted_type'] == key_conv_type:
            key_labels.append(parsed)
    
    for label in key_labels:
        match_num = label['match_num']
        charge_entry = {}
        
        for l, w_lst in long_map.iteritems():
            #l: long label
            #w_lst: list of corresponding wide labels
            unmatched = True
            
            for w_label in w_lst:
                if unmatched:
                    key = w_label + str(match_num)
                    if key in row:
                        unmatched = False
                        charge_entry[l] = row[key]
                        #print key, row
            
        longs.append(charge_entry)
    
    return longs


def df_wtl(wide_df, category='CHGS', row_id='KEY'):
    """Converts a DataFrame of wide-style procedure data into long-style procedure data

    Parameters
    =======================
    wide_df: pandas DataFrame object, required
        Contains wide data to be converted.

    category: string, required (default: 'CHGS')
        Category of wide data to be converted. Used to lookup LONG_MAPS definitions.

    row_id: string or list, required (default: 'KEY')
        Column name/label to use as identifier, which will be kept in the converted frame. Pass a list to preserve compound indexes.
    """
    
    # TODO: move this into LONG_MAPS somehow--these may need to be objects after all
    if category == 'CHGS':
        inclusion_lst = ['CHARGE']
    elif category == 'PR':
        inclusion_lst = ['PR', 'PRCCS']
    else:
        inclusion_lst = [category]
    
    long_dfs = []
    for i, row in wide_df.T.iteritems():
        # this is how to get the charges ready for input to row_wtl
        df = DataFrame(row_wtl(row.to_dict(), category))
        df[row_id] = row[row_id]
        long_dfs.append(df)
    
    c = pd.concat(long_dfs)
    #l = c[ (~c['PR'].isnull())|(~c['PRCCS'].isnull()) ].reset_index(drop=True).set_index(row_id)
    l = c[ (~c[inclusion_lst].apply(lambda x: x.isnull().any(), axis=1)) ].reset_index(drop=True).set_index(row_id)
    return l

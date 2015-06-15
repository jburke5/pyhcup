import re, os, zipfile

here = os.path.abspath(__file__)
dir_here = os.path.dirname(here)
BUNDLED_LOADFILE_DIR = os.path.join(dir_path, 'data', 'loadfiles')
BUNDLED_SID_SAMPLES_DIR = os.path.join(dir_path, 'data', 'sid_samples')
BUNDLED_UFLAGDEF = os.path.join(dir_path, 'data', 'uflags', 'uflag_definitions.csv')

DEFAULT_DATA_SOURCES = [
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

# long table definitions (static)
# TODO: consider conversion to sqlalchemy column objects
LONG_TABLE_BASE_FIELDS = [
        dict(field='KEY', length=18, data_type='numeric'),
        dict(field='VISITLINK', length=18, data_type='numeric'),
        dict(field='DAYSTOEVENT', length=18, data_type='numeric'),
        dict(field='YEAR', length=5, data_type='numeric'),
        dict(field='STATE', length=2, data_type='char'),
    ]

LONG_TABLE_DEFINITIONS = {
    'CHGS': LONG_TABLE_BASE_FIELDS + [
        dict(field='UNITS', length=11, data_type='numeric', scale=2),
        dict(field='REVCODE', length=4, data_type='char'),
        dict(field='RATE', length=9, data_type='numeric', scale=2),
        dict(field='CHARGE', length=12, data_type='numeric', scale=2),
        dict(field='CPTHCPCS', length=5, data_type='char'),
        dict(field='CPTMOD1', length=2, data_type='char'),
        dict(field='CPTMOD2', length=2, data_type='char'),
        dict(field='GROUP_NUMBER', length=5, data_type='numeric')
        ],
    'DX': LONG_TABLE_BASE_FIELDS + [
        dict(field='DX', length=10, data_type='char'),
        dict(field='DXV', length=2, data_type='char'),
        dict(field='DXCCS', length=5, data_type='char'),
        dict(field='DXPOA', length=1, data_type='char'),
        dict(field='DXatAdmit', length=1, data_type='char'),
        dict(field='TMDX', length=1, data_type='char'),
        dict(field='GROUP_NUMBER', length=5, data_type='numeric')
        ],
    'PR': LONG_TABLE_BASE_FIELDS + [
        dict(field='PR', length=10, data_type='char'),
        dict(field='PRCCS', length=5, data_type='char'),
        dict(field='PRDATE', length=6, data_type='char'),
        dict(field='PRDAY', length=2, data_type='char'),
        dict(field='PRMONTH', length=2, data_type='char'),
        dict(field='PRYEAR', length=4, data_type='char'),
        dict(field='PRV', length=2, data_type='char'),
        dict(field='PCLASS', length=1, data_type='char'),
        dict(field='PRMCCS', length=8, data_type='char'),
        dict(field='GROUP_NUMBER', length=5, data_type='numeric')
        ],
    'UFLAGS': LONG_TABLE_BASE_FIELDS + [
        dict(field='NAME', length=50, data_type='char'),
        dict(field='VALUE', length=2, data_type='numeric')
        ]
    }

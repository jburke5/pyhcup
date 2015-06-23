import os
from sqlalchemy.schema import Column
from sqlalchemy.types import Integer, BigInteger, String, Numeric

dir_here = os.path.dirname(os.path.abspath(__file__))
BUNDLED_LOADFILE_DIR = os.path.join(dir_here, 'data', 'loadfiles')
BUNDLED_SID_SAMPLES_DIR = os.path.join(dir_here, 'data', 'sid_samples')
BUNDLED_UFLAGDEF = os.path.join(dir_here, 'data', 'uflags', 'uflag_definitions.csv')

DEFAULT_DATA_SOURCES = [
    {
    'name': 'HCUP',
    'description': 'Healthcare Cost and Utilization Project',
    'content': 'contentnh_uncompressed', #this can be omitted
    'patterns': [
        '(?P<state_abbr>[A-Z]{2})_(?P<file>[A-Z]+)_(?P<year>[0-9]{4})_(?P<category>[A-Z_]+)\.(?P<file_extension>asc)',
        ]
    },
    {
    'name': 'HCUP',
    'description': 'Healthcare Cost and Utilization Project',
    'content': 'contentnh_zipcompressed',
    'patterns': [
        '(?P<state_abbr>[A-Z]{2})_(?P<file>[A-Z]+)_(?P<year>[0-9]{4})_(?P<category>[A-Z_]+)\.(?P<file_extension>exe|zip)',
        ]
    },
    {
    'name': 'HCUP',
    'description': 'Healthcare Cost and Utilization Project',
    'content': 'load_uncompressed',
    'patterns': [
        '(?P<state_abbr>[A-Z]{2})_(?P<file>[A-Z]+)_(?P<year>[0-9]{4})_(?P<category>[A-Z_]+)\.(?P<file_extension>sas)',
        ],
    },
    {
    'name': 'HCUP',
    'description': 'Healthcare Cost and Utilization Project',
    'content': 'contenth_uncompresed',
    'patterns': [
        '(?P<state_abbr>[A-Z]{2})_(?P<year>[0-9]{4})_(?P<category>daystoevent)\.(?P<file_extension>csv)',
        ],
    },
    {
    'name': 'PUDF',
    'description': 'Texas Inpatient Public Use Data File',
    'content': 'load_uncompressed',
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


# these loading programs are simply not available, even from HCUP
KNOWN_MISSING_LOADFILES = [
    {'state_abbr': 'RI', 'year': '2009', 'category': 'AHAL', 'file': 'SID'}
    ]


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
LONG_TABLE_BASE_COLUMNS = [
        Column('KEY', BigInteger()),
        Column('VISITLINK', BigInteger()),
        Column('DAYSTOEVENT', BigInteger()),
        Column('YEAR', Integer()),
        Column('STATE', String(2))
    ]

LONG_TABLE_DEFINITIONS = {
    'CHGS': LONG_TABLE_BASE_COLUMNS + [
        Column('UNITS', Numeric(precision=11, scale=2)),
        Column('REVCODE', String(4)),
        Column('RATE', Numeric(precision=9, scale=2)),
        Column('CHARGE', Numeric(precision=12, scale=2)),
        Column('CPTHCPCS', String(5)),
        Column('CPTMOD1', String(2)),
        Column('CPTMOD2', String(2)),
        Column('GROUP_NUMBER', Integer())
        ],
    'DX': LONG_TABLE_BASE_COLUMNS + [
        Column('DX', String(10)),
        Column('DXV', String(2)),
        Column('DXCCS', String(5)),
        Column('DXPOA', String(1)),
        Column('DXatAdmit', String(1)),
        Column('TMDX', String(1)),
        Column('GROUP_NUMBER', Integer())
        ],
    'PR': LONG_TABLE_BASE_COLUMNS + [
        Column('PR', String(10)),
        Column('PRCCS', String(5)),
        Column('PRDATE', String(6)),
        Column('PRDAY', String(2)),
        Column('PRMONTH', String(2)),
        Column('PRYEAR', String(4)),
        Column('PRV', String(2)),
        Column('PRCLASS', String(1)),
        Column('PRMCCS', String(8)),
        Column('GROUP_NUMBER', Integer()),
        ],
    'UFLAGS': LONG_TABLE_BASE_COLUMNS + [
        Column('NAME', String(50)),
        Column('VALUE', Integer())
        ]
    }

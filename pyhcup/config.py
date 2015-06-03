import re, os, zipfile

path = os.path.abspath(__file__)
dir_path = os.path.dirname(path)
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
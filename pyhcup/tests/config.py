from pyhcup import hachoir
from pyhcup.config import DEFAULT_DATA_SOURCES, BUNDLED_SID_SAMPLES_DIR, BUNDLED_LOADFILE_DIR

DISCOVERED_LOADFILES = hachoir.discover(root_path=BUNDLED_LOADFILE_DIR)
CONTENT_SOURCES = [i for i in DEFAULT_DATA_SOURCES
                    if 'content' in i['content']]
BUNDLED_SID_SAMPLES = hachoir.discover(root_path=BUNDLED_SID_SAMPLES_DIR,
                                        sources=CONTENT_SOURCES)
KNOWN_MISSING_LOADFILES = [
    # these are not available, even from HCUP
    {'state_abbr': 'RI', 'year': '2009', 'category': 'AHAL', 'file': 'SID'}
]
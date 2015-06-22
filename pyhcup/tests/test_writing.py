import unittest
from sqlalchemy import create_engine

import pyhcup
from config import DISCOVERED_LOADFILES, CONTENT_SOURCES, BUNDLED_SID_SAMPLES, KNOWN_MISSING_LOADFILES

class SQLiteTest(object):

    def setUp(self):
        self.engine = create_engine('sqlite:///:memory:')

    def tearDown(self):
        self.engine.dispose()
        self.engine = None

# class TestCreateTable(SQLiteTest):

#     def create_table(self, target):
#         for missing in KNOWN_MISSING_LOADFILES:
#             if all(missing[k] == target[k] for k in missing.keys()):
#                 err = '''
#                 Known missing loading program: {d}
#                 '''.format(d=target)
#                 raise unittest.SkipTest(err)
#         meta = pyhcup.get_meta(state=target['state_abbr'],
#                         year=target['year'],
#                         category=target['category'],
#                         datafile=target['file'])
#         table_name = "%s_%s_%s" % (target['state_abbr'], target['year'], target['category'])
#         table = pyhcup.db.create_table(self.engine, table_name, meta)
#         assert table.exists()

#     def test(self):
#         targets = [x for x in BUNDLED_SID_SAMPLES
#                if x['source'] == 'HCUP'
#                and x['content'] == 'contentnh_uncompressed'
#                ]
#         for x in targets:
#             yield self.create_table, x

class TestLoadRaw(SQLiteTest):

    def load_raw(self, target):
        for missing in KNOWN_MISSING_LOADFILES:
            if all(missing[k] == target[k] for k in missing.keys()):
                err = '''
                Known missing loading program: {d}
                '''.format(d=target)
                raise unittest.SkipTest(err)
        meta = pyhcup.get_meta(state=target['state_abbr'],
                        year=target['year'],
                        category=target['category'],
                        datafile=target['file'])
        handle = pyhcup.parser._open(target['full_path'],
            target['state_abbr'],
            target['year'],
            target['category']
        )
        table, rc = pyhcup.db.load_raw(self.engine, handle)
        assert table.exists(bind=self.engine) and rc > 0

    def test(self):
        targets = [x for x in BUNDLED_SID_SAMPLES
               if x['source'] == 'HCUP'
               and x['content'] == 'contentnh_uncompressed'
               ]
        for x in targets:
            yield self.load_raw, x
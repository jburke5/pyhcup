import unittest
from sqlalchemy import create_engine
from testconfig import config as test_config

import pyhcup
from config import DISCOVERED_LOADFILES, CONTENT_SOURCES, BUNDLED_SID_SAMPLES, KNOWN_MISSING_LOADFILES


class DatabaseTest(object):

    def setUp(self):
        self.engine = create_engine(test_config['database']['engine'])

    def tearDown(self):
        self.engine.dispose()
        self.engine = None


class TestLoadRaw(DatabaseTest):

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


class TestCreateLongTable(DatabaseTest):

    def create_long_table(self, table_name, category):
        table = pyhcup.db.gen_long_table(table_name, category)
        table.create(bind=self.engine)
        assert table.exists(bind=self.engine)

    def test(self):
        for k in pyhcup.config.LONG_TABLE_DEFINITIONS.keys():
            yield self.create_long_table, k, k
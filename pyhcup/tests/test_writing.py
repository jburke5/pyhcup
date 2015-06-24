import unittest
from sqlalchemy import create_engine
from testconfig import config as test_config

import pyhcup
from config import BUNDLED_SID_SAMPLES, KNOWN_MISSING_LOADFILES


class DatabaseTest(object):

    def setUp(self):
        self.engine = create_engine(test_config['database']['engine'])

    def tearDown(self):
        self.engine.dispose()
        self.engine = None


class TestCreateLongTable(DatabaseTest):

    def create_long_table(self, table_name, category):
        table = pyhcup.db.gen_long_table(table_name, category)
        table.create(bind=self.engine)
        success = table.exists(bind=self.engine)
        table.drop(bind=self.engine)
        assert success

    def test(self):
        for k in pyhcup.config.LONG_TABLE_DEFINITIONS.keys():
            yield self.create_long_table, k, k


class TestLoadRaw(DatabaseTest):

    def load_raw(self, target):
        for missing in KNOWN_MISSING_LOADFILES:
            if all(missing[k] == target[k] for k in missing.keys()):
                err = '''
                Known missing loading program: {d}
                '''.format(d=target)
                raise unittest.SkipTest(err)
        handle = pyhcup.parser._open(target['full_path'],
            target['state_abbr'],
            target['year'],
            target['category']
        )
        table, rc = pyhcup.db.load_raw(self.engine, handle)
        success = table.exists(bind=self.engine) and rc > 0
        table.drop(bind=self.engine)
        assert success

    def test(self):
        targets = [x for x in BUNDLED_SID_SAMPLES
               if x['source'] == 'HCUP'
               and x['content'] == 'contentnh_uncompressed'
               ]
        for x in targets:
            yield self.load_raw, x


class TestProcessRawTable(DatabaseTest):

    def process_raw_table(self, target):
        if self.engine.name == 'sqlite':
            raise unittest.SkipTest('Test does not support SQLite')
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
        p_table, rc = pyhcup.db.process_raw_table(self.engine, table.name,
            meta, target['state_abbr'], target['year'])
        success = p_table.exists(bind=self.engine) and rc > 0
        table.drop(bind=self.engine)
        p_table.drop(bind=self.engine)
        assert success

    def test(self):
        targets = [x for x in BUNDLED_SID_SAMPLES
               if x['source'] == 'HCUP'
               and x['content'] == 'contentnh_uncompressed'
               ]
        for x in targets:
            yield self.process_raw_table, x

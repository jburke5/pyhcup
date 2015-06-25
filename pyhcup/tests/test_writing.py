import unittest
from sqlalchemy import create_engine
from testconfig import config as test_config

import pyhcup
from config import BUNDLED_SID_SAMPLES, KNOWN_MISSING_LOADFILES

ENGINES = [create_engine(d) for d in test_config['databases'].values()]

class DatabaseTest(object):

    def setUp(self):
        pass

    def tearDown(self):
        pass


class TestCreateLongTable(DatabaseTest):

    def create_long_table(self, engine, table_name, category):
        table = pyhcup.db.gen_long_table(table_name, category)
        table.create(bind=engine)
        success = table.exists(bind=engine)
        table.drop(bind=engine)
        assert success

    def test(self):
        for e in ENGINES:
            for k in pyhcup.config.LONG_TABLE_DEFINITIONS.keys():
                yield self.create_long_table, e, k, k


class TestLoadRaw(DatabaseTest):

    def load_raw(self, engine, target):
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
        table, rc = pyhcup.db.load_raw(engine, handle)
        success = table.exists(bind=engine) and rc > 0
        table.drop(bind=engine)
        assert success

    def test(self):
        targets = [x for x in BUNDLED_SID_SAMPLES
               if x['source'] == 'HCUP'
               and x['content'] == 'contentnh_uncompressed'
               ]
        for e in ENGINES:
            for x in targets:
                yield self.load_raw, e, x


class TestProcessRawTable(DatabaseTest):

    def process_raw_table(self, engine, target):
        if engine.name == 'sqlite':
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
            int(target['year']),
            target['category']
        )
        table, rc = pyhcup.db.load_raw(engine, handle)
        p_table, rc = pyhcup.db.process_raw_table(engine, table,
            meta, target['state_abbr'], target['year'])
        success = p_table.exists(bind=engine) and rc > 0
        table.drop(bind=engine)
        p_table.drop(bind=engine)
        assert success

    def test(self):
        targets = [x for x in BUNDLED_SID_SAMPLES
               if x['source'] == 'HCUP'
               and x['content'] == 'contentnh_uncompressed'
               ]
        for e in ENGINES:
            for x in targets:
                yield self.process_raw_table, e, x


class TestProcessedTableIntegrity(DatabaseTest):

    def test_processed_table(self, engine, target):
        if engine.name == 'sqlite':
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
            int(target['year']),
            target['category']
        )
        table, rc = pyhcup.db.load_raw(engine, handle)
        p_table, rc = pyhcup.db.process_raw_table(engine, table,
            meta, target['state_abbr'], target['year'])
        # TODO: update success to compare data on disk to db
        #success = p_table.exists(bind=engine) and rc > 0
        success = False
        table.drop(bind=engine)
        p_table.drop(bind=engine)
        assert success

    def test(self):
        targets = [x for x in BUNDLED_SID_SAMPLES
               if x['source'] == 'HCUP'
               and x['content'] == 'contentnh_uncompressed'
               ]
        for e in ENGINES:
            for x in targets:
                yield self.process_raw_table, e, x

import unittest
import pandas as pd
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
        table = pyhcup.db.load_raw(engine, handle)
        rc = pyhcup.db.get_rowcount(table, engine)
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
        table = pyhcup.db.load_raw(engine, handle)
        p_table, processed_sql = pyhcup.db.process_raw_table(engine, table,
            meta, target['state_abbr'], target['year'])
        rc = pyhcup.db.get_rowcount(p_table, engine)
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

    def rough_compare(self, v1, v2):
        """
        Perform a rough comparison between v1 and v2.
        Return True if they are roughly equal.
        """
        try:
            fv1 = int(v1)
        except:
            fv1 = None
        
        try:
            fv2 = int(v2)
        except:
            fv2 = None
        
        if pd.isnull(v1) and pd.isnull(v2):
            return True
        elif fv1 is not None and fv2 is not None:
            return fv1 == fv2
        else:
            return v1 == v2
    
    def validate_processed_data(self, engine, target):
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
        
        # load up the data
        raw_table = pyhcup.db.load_raw(engine, handle)
        p_table, processed_sql = pyhcup.db.process_raw_table(engine,
            raw_table, meta, target['state_abbr'], target['year'])
        
        # fetch it back
        s = p_table.select()
        r = s.execute()
        fetched = r.fetchmany(100)
        r.close() # or we hang on drop later
        f_df = pd.DataFrame(fetched, columns=r._metadata.keys)
        
        # read in the source data as a DataFrame
        # and replace sentinel values per normal
        source_df = pyhcup.read(target['full_path'], meta)
        source_df = pyhcup.replace_sentinels(source_df)
        
        # compare the data from source vs fetched
        outcomes = []
        for i, row in source_df.iterrows():
            [outcomes.append(self.rough_compare(v, f_df.ix[i][c]))
             for c, v in row.iteritems()]
        
        success = all(outcomes)
        
        # clean up tables
        raw_table.drop(bind=engine)
        p_table.drop(bind=engine)
        
        # clean up other data
        f_df = None
        source_df = None
        outcomes = None
        assert success

    def test(self):
        #raise NotImplementedError('TestProcessedTableIntegrity has not been completed.')
        
        targets = [x for x in BUNDLED_SID_SAMPLES
               if x['source'] == 'HCUP'
               and x['content'] == 'contentnh_uncompressed'
               ]
        for e in ENGINES:
            for x in targets:
                yield self.validate_processed_data, e, x

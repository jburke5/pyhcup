import unittest
import pandas as pd

import pyhcup
from pyhcup import hachoir, parser, sas, tx
from pyhcup.config import DEFAULT_DATA_SOURCES, BUNDLED_SID_SAMPLES_DIR

class TestDiscover(unittest.TestCase):
    def setUp(self):
        self.discovered = hachoir.discover()
    
    def test_is_list_of_dicts(self):
        [self.assertEqual(type(i), dict) for i in self.discovered]
    
    def test_proper_keys(self):
        expected = sorted(
                    ['category', 'file_extension', 'size_on_disk', 'source',
                    'state_abbr', 'file', 'year', 'directory', 'filename',
                    'full_path', 'content']
                    )
        for i in self.discovered:
            k = sorted(i.keys())
            self.assertEqual(k,
                             expected,
                             'Key mismatch for {0}, expected {1}'\
                                 .format(k, expected)
                             )


class TestMeta(unittest.TestCase):
    def setUp(self):
        self.discovered = hachoir.discover()
        self.sas_meta_paths = [i for i in self.discovered
                               if i['file_extension'].lower() == 'sas']
        self.pudf_meta_paths = [i for i in self.discovered
                                if i['file_extension'].lower() == 'txt'
                                and i['state_abbr'].lower() == 'tx']

    def test_sas_meta_are_dataframes(self):
        for i in self.sas_meta_paths:
            fp = i['full_path']
            product = sas.meta_from_sas(fp)
            t = type(product)
            self.assertEqual(t,
                             pd.DataFrame,
                             'Not DataFrame: sas.meta_from_sas({fp}) ({t})'\
                                 .format(fp=fp, t=t)
                             )
    
    def test_tx_meta_are_dataframes(self):
        for i in self.pudf_meta_paths:
            fp = i['full_path']
            product = tx.meta_from_txt(fp)
            t = type(product)
            self.assertEqual(t,
                             pd.DataFrame,
                             'Not DataFrame: tx.meta_from_txt({fp}) ({t})'\
                                 .format(fp=fp, t=t)
                             )
    
    def test_get_meta_vs_meta_from_sas(self):
        """
        pyhcup.get_meta() is a shortcut that helps to call
        pyhcup.sas.meta_from_sas(). Given certain inputs, these should
        generate identical DataFrames for the meta data (loading file) in
        question.
        """
        for i in self.sas_meta_paths:
            fp = i['full_path']
            mfs = sas.meta_from_sas(fp)
            gm = pyhcup.get_meta(state=i['state_abbr'], year=i['year'],
                                 category=i['category'], datafile=i['file'])
            self.assertTrue((mfs.values == gm.values).all(),
                            '''
                            sas.meta_from_sas('{fp}') != pyhcup.get_meta(state={st}, year={yr}, category={c}, datafile={d})
                            '''.format(fp=fp, st=i['state_abbr'], yr=i['year'], c=i['category'], d=i['file'])
                            )


class TestSampleData(unittest.TestCase):
    def setUp(self):
        content_sources = [i for i in DEFAULT_DATA_SOURCES
                           if 'content' in i['content']]
        self.discovered = hachoir.discover(root_path=BUNDLED_SID_SAMPLES_DIR,
                                           sources=content_sources)
        self.uncompressed = [i for i in self.discovered
                             if i['content'] == 'contentnh_uncompressed']
        self.uncompressed_hcup_samples = [i for i in self.uncompressed
                                          if i['source'] == 'HCUP']
    
    def test_read_hcup_uncompressed_samples(self):
        """
        Should be able to load any uncompressed HCUP sample data into a
        DataFrame, using the bundled metadata files.
        
        for i in self.uncompressed_hcup_samples:
            fp = i['full_path']
            m = 
            read
        """
        pass


if __name__ == '__main__':
    unittest.main()

import unittest
import pandas as pd

import pyhcup
from pyhcup import hachoir, parser, sas, tx
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

# TODO: split these cases into separate files?
# TODO: test database loading (replace with SQLA?)

class TestDiscover(unittest.TestCase):
    def test_is_list_of_dicts(self):
        [self.assertEqual(type(i), dict) for i in DISCOVERED_LOADFILES]
    
    def test_proper_keys(self):
        expected = sorted(
                    ['category', 'file_extension', 'size_on_disk', 'source',
                    'state_abbr', 'file', 'year', 'directory', 'filename',
                    'full_path', 'content']
                    )
        for i in DISCOVERED_LOADFILES:
            k = sorted(i.keys())
            self.assertEqual(k,
                             expected,
                             'Key mismatch for {0}, expected {1}'\
                                 .format(k, expected)
                             )


class TestMeta(unittest.TestCase):
    def setUp(self):
        self.sas_meta_paths = [i for i in DISCOVERED_LOADFILES
                               if i['file_extension'].lower() == 'sas']
        self.pudf_meta_paths = [i for i in DISCOVERED_LOADFILES
                                if i['file_extension'].lower() == 'txt'
                                and i['state_abbr'].lower() == 'tx']
    
    def test_sas_meta_are_dataframes(self):
        for i in self.sas_meta_paths:
            fp = i['full_path']
            product = sas.meta_from_sas(fp)
            err = '''
                  Not DataFrame: sas.meta_from_sas('{fp}') ({t})
                  '''.format(fp=fp, m=m, t=type(product))
            yield check_is_dataframe, product, err
    
    def test_tx_meta_are_dataframes(self):
        for i in self.pudf_meta_paths:
            fp = i['full_path']
            product = tx.meta_from_txt(fp)
            err = '''
                  Not DataFrame: tx.meta_from_txt('{fp}') ({t})
                  '''.format(fp=fp, t=type(product))
            self.assertTrue(is_dataframe(product))

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
                            '''.format(fp=fp, st=i['state_abbr'],
                                       yr=i['year'], c=i['category'],
                                       d=i['file'])
                            )


def test_uncompressed_hcup_samples_generator():
    targets = [i for i in BUNDLED_SID_SAMPLES
               if i['source'] == 'HCUP'
               and i['content'] == 'contentnh_uncompressed'
               ]
    for i in targets:
        yield check_hcup_sample, i


def check_hcup_sample(target_dict):
    """
    Verifies that the provided HCUP sample data can be read by the included
    loading program files.
    
    target_dict: dictionary produced by pyhcup.hachoir.discover
    """
    
    # skip test if known to be missing a loadfile
    for missing in KNOWN_MISSING_LOADFILES:
        if all(missing[k] == target_dict[k] for k in missing.keys()):
            err = '''
            Known missing loading program: {d}
            '''.format(d=target_dict)
            raise unittest.SkipTest(err)
    
    fp = target_dict['full_path']
    m = pyhcup.get_meta(state=target_dict['state_abbr'],
                        year=target_dict['year'],
                        category=target_dict['category'],
                        datafile=target_dict['file'])
    product = pyhcup.read(fp, m)
    err = '''
            Not DataFrame: pyhcup.read('{fp}', {m}) ({t})
            '''.format(fp=fp, m=m, t=type(product))
    assert is_dataframe(product), err


def is_dataframe(obj):
    return type(obj) == pd.DataFrame


def check_is_dataframe(obj, err='Object type is not pandas.DataFrame'):
    assert is_dataframe(obj), err


if __name__ == '__main__':
    unittest.main()

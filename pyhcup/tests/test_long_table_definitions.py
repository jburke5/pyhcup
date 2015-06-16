import unittest
import sqlalchemy

import pyhcup
from pyhcup.config import LONG_TABLE_DEFINITIONS


def test_long_definitions_to_tables_generator():
    for category, columns in LONG_TABLE_DEFINITIONS.iteritems():
        yield check_long_definition_to_table, i

def check_long_definition_to_table(category, columns):
    """
    Verifies that the included long table definitions actually
    construct valid tables with SQLAlchemy.
    """
    assert False, 'Unable to generate SQLAlchemy table with columns in LONG_TABLE_DEFINITIONS[{k}]'.format(k=category)


def test_long_tables_match_definitions_generator():
    for category, columns in LONG_TABLE_DEFINITIONS.iteritems():
        yield check_long_table_matches_definition, i

def check_long_table_matches_definition(category, columns):
    """
    Verifies that the tables generated using included long table
    definitions match the columns described therein.
    """
    assert False, 'Generated table does not match cols provided by LONG_TABLE_DEFINITIONS[{k}]'.format(k=category)


if __name__ == '__main__':
    unittest.main()

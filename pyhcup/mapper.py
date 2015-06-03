import math, re, os, zipfile, json
from datetime import datetime
import pandas as pd
import numpy as np

path = os.path.abspath(__file__)
dir_path = os.path.dirname(path)
BUNDLED_MAP_DIR = os.path.join(dir_path, 'data', 'maps')


class FieldMap(object):
    def __init__(self, field_in, field_out, val_map=None, default_val=None, default_keep=False, overwrite=True):
        """FieldMap objects describe and apply data mapping functions, such as substitution based on a dictionary, as well as specifying behavior for default values and whether or not to discard values not spoken for by the substition dictionary.

        Parameters
        ------------------------------------------
        field_in : string, required

        field_out : string, required

        val_map : dict, optional
            If val_map is provided, keys will be mapped over to values if present in field_in. If val_map is not provided, all values from field_in will be kept as values for field_out (only the column/Series name will be changed).

        default_val : any, optional (default: None)
            Use this value by default if value for field_in not found in val_map.keys(). Ignored if val_map is None.

        default_keep : boolean, optional (default: False)
            If field_in value not found in val_map.keys(), keep the value from field_in. Ignored if val_map is None.

            If both default_val and default_keep are given, the val_map is applied, the field_in value is kept for field_in values not in the val_map, and default_val is used for remaining None values from field_in.Parameters
        
        overwrite : boolean, optional (default: True)
            If neither default_val nor default_keep are used, you can set overwrite=False to keep values that already exist in df2. This is mostly for mapping PUDF's two race and ethnicity columns into HCUP's single race column.
        """
        self.field_in = field_in
        self.field_out = field_out
        self.val_map = val_map
        self.default_val = default_val
        self.default_keep = default_keep
        self.overwrite = overwrite
    
    
    def hr_lines(self):
        lines = []
        lines.append("Field name in: %s" % self.field_in)
        lines.append("Field name out: %s" % self.field_out)
        if self.val_map is None:
            lines.append("All incoming values are preserved; only the name of this field is changed as part of the mapping.")
        else:
            lines.append("Mapping options:")
            lines.append("    default_val: %s" % self.default_val)
            lines.append("    default_keep: %s" % self.default_keep)
            lines.append("    overwrite: %s" % self.overwrite)
            lines.append("Values map:")
            for i, o in self.val_map.iteritems():
                if len(i) == 0:
                    i = "[empty string]"
                if len(o) == 0:
                    o = "[empty string]"
                lines.append("    %s: %s" % (i, o))
        
        return lines
    
    
    def hr_dump(self, handle):
        """handle must be a writeable file handle
        """
        [handle.write(l) for l in self.hr_lines()]
    
    
    def apply(self, df_in, df_out):
        """Map a field from df_in over to df_out. Assumes that df_in and df_out share an index.
        """
        # translating values
        if self.field_in in df_in.columns:
            # field_in exists in df_in; can likely proceed
            if self.val_map is None:
                # no values to map; instead simply copy column over with field_out as label
                df_out[self.field_out] = df_in[self.field_in]
                
            else:
                # there is a map of values to deal with
                # cast these as both strings and ints, if we are able to, in order to make sure we don't miss any vals due to strong typing in numpy arrays
                fully_cast = {}
                for k, v in self.val_map.iteritems():
                    try:
                        fully_cast[int(k)] = v
                    except:
                        # super gross
                        pass
                    
                    try:
                        fully_cast[str(k)] = v
                    except:
                        # x2
                        pass
                
                self.val_map = fully_cast
                
                if self.default_val is not None:
                    # there is a default value to use in replacements
                    
                    if self.default_keep is False:
                        # use default_val for values not mapped by the val_map
                        df_out[self.field_out] = np.where(df_in[self.field_in].isin(self.val_map.keys()), df_in[self.field_in].map(self.val_map), self.default_val)
                    else:
                        # keep values from field_in for things not mapped by the val_map
                        df_out[self.field_out] = np.where(df_in[self.field_in].isin(self.val_map.keys()), df_in[self.field_in].map(self.val_map), df_in[self.field_in])
                        
                        # BUT replace them with default_val if they were None in the first place
                        df_out[self.field_out] = np.where((~df_in[self.field_in].isin(self.val_map.keys())) & (df_in[self.field_in] == None), self.default_val, df_out[self.field_out])
                
                else:
                    if self.default_keep is True:
                        # keep values from field_in for things not mapped by the val_map
                        df_out[self.field_out] = np.where(df_in[self.field_in].isin(self.val_map.keys()), df_in[self.field_in].map(self.val_map), df_in[self.field_in])
                    
                    elif self.overwrite is False:
                        # map values where possible, but do not overwrite vals in df2 if there is nothing to map
                        df_out[self.field_out] = np.where(df_in[self.field_in].isin(self.val_map.keys()), df_in[self.field_in].map(self.val_map), df_out[self.field_out])
                    
                    else:
                        # the most vanilla: just run the val_map without any special rules
                        df_out[self.field_out] = df_in[self.field_in].map(self.val_map)


class FieldMapSet(object):
    """Holds a collection of FieldMap objects and methods for dealing with them en masse
    """

    def __init__(self, json_path=None, field_pairs=None, field_values=None):
        """Creates a FieldMapSet
        
        Parameters
        ------------------------------------------
        json_maps: str, optional (required if field_pairs and field_values are None)
            Should be a path to a file containing objects that can be used to generate FieldMap objects. For example, a file generated by FieldMapSet.json_dump().

        field_pairs: DataFrame or str, optional (required if json_maps is None)
            May be either a pandas DataFrame containing field_pair fields already, or a path to a csv file containing the same.

        field_values: DataFrame or str, optional (required if json_maps is None)
            May be either a pandas DataFrame containing field_value fields already, or a path to a csv file containing the same.
            
            
        Example
        ------------------------------------------
        rp = '/home/hcup/texas_pudf/' # root path
        
        # read in some data, in this case from TX PUDF
        target = os.path.join(rp, 'pudf1q99.txt')
        meta = pyhcup.meta.get('TX', 1999, category='base')
        df = pyhcup.read(target, meta, nrows=250000)
        
        # read in default map set
        json_maps = os.path.join(rp, 'tx_pudf_base_mapping.json')
        fms = pyhcup.pd.FieldMapSet(json_maps)
        
        # apply and document the mapping
        df2 = fms.apply(df)
        h = open(os.path.join(rp, "manifest.txt"), "w")
        h2 = open(os.path.join(rp, "dump.json"), "w")
        fms.manifest(h)
        fms.dump_json(h2)
        """
        if isinstance(json_path, str):
            # attempt to load FieldMap objects out of this file
            fms = [FieldMap(**j) for j in json.load(open(json_path))]
        else:
            # do it the hard way, from csv files or provided DataFrames
            if isinstance(field_pairs, pd.DataFrame):
                fp_df = field_pairs
            elif isinstance(field_pairs, str):
                try:
                    fp_df = pd.read_csv(field_pairs).set_index('pair_id')
                except:
                    raise Exception("Unable to create DataFrame using field_pairs (%s) as path" % field_pairs)
            else:
                raise Exception("Without a json_path, field_pairs must either be a DataFrame or a path to a csv file (got %s)" % type(field_pairs))
    
            if isinstance(field_values, pd.DataFrame):
                fv_df = field_values
            elif isinstance(field_values, str):
                try:
                    fv_df = pd.read_csv(field_values).applymap(lambda x: "" if x == "[empty string]" else x)
                except:
                    raise Exception("Unable to create DataFrame using field_values (%s) as path" % field_values)
            else:
                raise Exception("Without a json_path, field_values must either be a DataFrame or a path to a csv file (got %s)" % type(field_pairs))
    
            fms = []
            
            for i in fp_df.T:
                fp = fp_df.ix[i]
                d = {
                    'field_in': fp['field_in'],
                    'field_out': fp['field_out'],
                    }
                
                for x in ['default_val', 'overwrite', 'default_keep']:
                    if x in fp and not pd.isnull(fp[x]):
                        d[x] = fp[x]
                
                fv = fv_df[ fv_df['pair_id'] == i ]
                if len(fv) > 0:
                    val_map = {}
                    for k, v in fv.T.iterkv():
                        val_map[v['value_in']] = v['value_out']
                    
                    d['val_map'] = val_map
                
                fms.append(FieldMap(**d))
        
        self.maps = fms
    
    
    def apply(self, df_in, df_out=None):
        """Applies the FieldMaps in self.maps to the DataFrame df_in; returns DataFrame containing mapped fields and values.
        
        If df_out is provided, attempts to map df_in into df_out. This may fail if the indexes are not identical.
        """
        if isinstance(df_out, pd.DataFrame):
            result = df_out
        else:
            # copy this index so we can easily map values
            result = pd.DataFrame(index=df_in.index)
        
        # apply FieldMap objects
        [m.apply(df_in, result) for m in self.maps]
        return result
    
    
    def manifest(self, path_or_handle, mode="a"):
        """Writes a text file describing the FieldMapSet
        
        path_or_handle must be a writeable (w or a) file handler or a system path. If a path is given, this will attempt to create or amend a file at that path.

        If given a path, opens it in append mode by default. Can overwrite by passing mode.
        """
        if isinstance(path_or_handle, file):
            h = path_or_handle
            if 'a' in h.mode or 'w' in h.mode:
                # we have a writeable file handle; use it
                pass
            else:
                raise Exception("Received a file handle without write permissions (mode %s)" % h.mode)
        elif isinstance(path_or_handle, str):
            try:
                h = open(path_or_handle, mode)
            except:
                raise Exception("Unable to open the provided path (%s) using mode %s" % (path_or_handle, mode))
        else:
            raise Exception("path_or_handle must either be a writeable file handle or a path to create/append a file for output.")
        
        now = datetime.now()
        
        o = []
        o.append("Manifest of FieldMap objects (count: %s)" % len(self.maps))
        o.append("Generated %s" % now.isoformat(sep=' '))
        o.append("FieldMap behavior (from docstring):")
        o.append("###")
        o.append(FieldMap.__init__.__doc__)
        o.append("###")
        o.append("")
        o.append("FieldMap objects in this set:")
        for m in self.maps:
            o.append("==============================")
            lst = m.hr_lines()
            for l in lst:
                o.append(l)
            o.append("==============================")
            o.append("")
        
        [h.write(line + '\n') for line in o]
        h.flush()
        pass
    
    
    def dump_json(self, h):
        """Creates a JSON dump of the FieldMap objects in self.maps using handle h, including handle's preset read/write mode.
        """
        json.dump([m.__dict__ for m in self.maps], h)
        h.flush()
        pass

def tx_to_hcup_fms(filename='tx_pudf_base_mapping.json'):
    target = os.path.join(BUNDLED_MAP_DIR, filename)
    fms = FieldMapSet(json_path=target)
    return fms
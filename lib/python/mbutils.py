import json
import os
import re
from os import path
from collections import OrderedDict
from functools import cmp_to_key

def find_in_parent(filename, starting_dir=None):
    '''Look up the directory tree until you find a file.'''
    root = find_root(filename, starting_dir)
    return path.join(root, filename)

def find_root(filename, starting_dir=None):
    '''Look up the directory tree until you find a file.'''
    if starting_dir is None:
        starting_dir = os.getcwd()

    candidate_file = path.join(starting_dir, filename)

    if (path.isfile(candidate_file) or path.isdir(candidate_file)):
        return starting_dir
    elif starting_dir == '/':
        raise IOError('File not found in any directory')
    else:
        return find_root(filename, path.dirname(starting_dir))

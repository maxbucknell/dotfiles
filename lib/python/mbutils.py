import json
import os
from os import path

def find_in_parent(filename, starting_dir=None):
    '''Look up the directory tree until you find a file.'''
    if starting_dir is None:
        starting_dir = os.getcwd()

    candidate_file = path.join(starting_dir, filename)

    if (path.isfile(candidate_file)):
        return candidate_file
    elif starting_dir == '/':
        raise IOError('File not found in any directory')
    else:
        return find_in_parent(filename, path.dirname(starting_dir))

def _parse_composer_manifest(path):
    '''Parse composer.json into dict'''
    with open(path, 'r') as composer_file:
        manifest = json.load(composer_file)
        return manifest

def _get_all_autoloaders(manifest):
    '''Combine all PSR-0 and PSR-4 autoloaders'''
    autoloaders = dict()

    for type in ['psr-0', 'psr-4']:
        autoloaders.update(_get_autoloaders_by_type(manifest, type))

    return dict((p, ns) for (ns, p) in autoloaders.items())

def _get_autoloaders_by_type(manifest, type):
    '''Get one kind of autoloader'''
    try:
        return manifest['autoload'][type]
    except KeyError:
        return dict()

def match_path(autoloaders, dirname):
    '''Find namespace for a given path'''
    prefixes = sorted(autoloaders.keys(), key=len)

    try:
        prefix = next(p for p in prefixes if dirname.startswith(p))
        namespace = autoloaders[prefix]
        remainder = dirname.replace(prefix, '', 1)
    except StopIteration:
        namespace = ''
        remainder = dirname

    return (namespace, remainder)

def convert_path(dirname):
    '''Naively convert path to namespace'''
    return dirname.replace('/', '\\')

def get_namespace(dirname):
    '''Convert dirname into namespace intelligently.'''
    composer_json = find_in_parent('composer.json', dirname)
    composer_manifest = _parse_composer_manifest(composer_json)
    repo_root = path.dirname(composer_json)
    relative_path = path.relpath(dirname, repo_root)

    autoloaders = _get_all_autoloaders(composer_manifest)

    (namespace, remainder) = match_path(autoloaders, relative_path)

    return namespace + convert_path(remainder)


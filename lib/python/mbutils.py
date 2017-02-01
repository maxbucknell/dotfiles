import json
import os
import re
from os import path
from collections import OrderedDict

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

def prepare_arguments(param_tags):
    arguments = generate_arguments(param_tags)

def format_method(snip):
    '''Convert expanded snippet into method name and args.'''
    params = get_params_map(snip)

    if len(params) is 0:
        return

    sorted_params = sort_params(params.values())

    delete_param_tags(snip, params)
    place_to_insert_params = snip.snippet_start[0] + params.keys()[0]
    snip.buffer[place_to_insert_params:place_to_insert_params] = sorted_params

    arguments = generate_arguments(sorted_params)
    arguments[-1] = arguments[-1].replace(',', '')
    args_line = snip.snippet_end[0] - 3
    snip.buffer[args_line:args_line + 1] = arguments

def delete_param_tags(snip, params):
    '''Sort @param PHPDoc tags so optional ones come later.'''
    for idx, relative_line_number in enumerate(params.keys()):
        # Have to subtract idx, because we are removing a line each time.
        line_number = relative_line_number + snip.snippet_start[0] - idx
        snip.buffer[line_number:line_number + 1] = []

def get_params_map(snip):
    '''Get a map of @param PHPDoc tags, line_number: line.'''
    lines = get_snippet_lines(snip)
    return OrderedDict([[k, v] for k, v in enumerate(lines) if '@param' in v])

def generate_arguments(params):
    '''Generate the function arguments from PHPDoc @params.'''
    return [get_argument_line(x) for x in params]

def sort_params(params):
    '''Sort params to put optional arguments at the end.'''
    def sorter(left, right):
        [left_is_optional, right_is_optional] = \
                [is_union_with_null(x) for x in [left, right]]

        if (left_is_optional and not right_is_optional):
            return 1
        if (not left_is_optional and right_is_optional):
            return -1

        return 0

    return sorted(params, sorter)

def get_snippet_lines(snip):
    '''Get the relevant slice of a snippet buffer.'''
    start_line = snip.snippet_start[0]
    finish_line = snip.snippet_end[0]
    return snip.buffer[start_line:finish_line]

def get_argument_line(param):
    '''Convert line from @param tag to method parameter.'''
    expression = '\s*\*\s+@param\s+([^\s]+)\s+(\$[^\s]+).*'
    result = re.search(expression, param)

    type = map_type(result.group(1))
    name = result.group(2)

    return format_argument_line(type, name)

def map_type(type):
    '''Convert PHPDoc type declaration into a PHP type hint.'''
    if (is_union_with_null(type)):
        return map_type(type.replace('|null', ''))
    if (is_union_type(type)):
        # PHP doesn't support union type hints yet.
        return None
    if (is_array_type(type)):
        # PHP doesn't have complex generics yet.
        return 'array'
    # A plain type
    return type

def is_union_with_null(type):
    '''Test if PHPDoc type has a null option.'''
    return '|null' in type

def is_union_type(type):
    '''Test if PHPDoc type is any kind of union.'''
    return '|' in type

def is_array_type(type):
    '''Test if PHPDoc type is an array...'''
    return '[]' in type

def format_argument_line(type, name):
    if (type is None):
        return '        {},'.format(name)
    else:
        return '        {} {},'.format(type, name)


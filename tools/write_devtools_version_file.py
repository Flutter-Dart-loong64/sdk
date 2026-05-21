#!/usr/bin/env python3
# Copyright (c) 2026, the Dart project authors. Please see the AUTHORS file
# for details. All rights reserved. Use of this source code is governed by a
# BSD-style license that can be found in the LICENSE file.

import argparse
import json
import os
import re
import sys


def read_devtools_version(pubspec_path):
    with open(pubspec_path, encoding='utf-8') as pubspec:
        for line in pubspec:
            match = re.match(r'^version:\s*(\S+)\s*$', line)
            if match:
                return match.group(1)
    raise ValueError(f'Could not find version in {pubspec_path}')


def main():
    parser = argparse.ArgumentParser(
        description='Writes DevTools version metadata for the Dart SDK.')
    parser.add_argument('--pubspec', required=True)
    parser.add_argument('--output', required=True)
    args = parser.parse_args()

    version = read_devtools_version(args.pubspec)
    os.makedirs(os.path.dirname(args.output), exist_ok=True)
    with open(args.output, 'w', encoding='utf-8') as output:
        json.dump({'version': version}, output, separators=(',', ':'))
        output.write('\n')
    return 0


if __name__ == '__main__':
    sys.exit(main())

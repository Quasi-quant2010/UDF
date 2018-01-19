#!/usr/bin/env python
# -*- coding: utf-8 -*-

from collenctions import defaultdict
import sys, traceback

dict_test = defaultdict(int)

# stdin
for line in sys.stdin:
    # key   : string
    # value : int
    line = line.strip()
    key, value = line.split("\t")
    dict_test[key] += int(value)

# stdout
for key in dict_test.keys():
    try:
        sys.stdout.write("%s\t%d\n" % (key,dict_test[key]))
    except:
        sys.stderr.write("%s\n" % (traceback.format_exc()))

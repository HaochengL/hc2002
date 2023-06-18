####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
#
# HX-2023-06-12: 10 points
# Please *translate* into Python the SML solution
# to word_neighbors (which is the one for Assign03-02)
#

def modify_char(string, index, new_char):
    return string[:index] + new_char + string[index + 1:]

def word_neighbors(word):
    AB = "abcdefghijklmnopqrstuvwxyz"
    len_word = len(word)

    def n_each(i):
        return [modify_char(word, k, ch_new) if k == i else word[k] for k, ch_new in enumerate(AB)]

    raw = []
    for i in range(len_word):
        raw.extend(n_each(i))

    return [w for w in raw if w != word]




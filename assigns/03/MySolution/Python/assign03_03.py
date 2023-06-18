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

def string_to_char_list(string):
    return list(string)

def word_neighbors(word):
    len_word = len(word)
    letters = string_to_char_list("abcdefghijklmnopqrstuvwxyz")

    def gen_neighbors(i, char):
        neighbors = []
        for new_char in letters:
            if char != new_char:
                new_word = word[:i] + new_char + word[i+1:]
                neighbors.append(new_word)
        return neighbors

    neighbor_list = []
    for i, char in enumerate(word):
        neighbors = gen_neighbors(i, char)
        neighbor_list.extend(neighbors)

    return list(filter(lambda s: s != "", neighbor_list))
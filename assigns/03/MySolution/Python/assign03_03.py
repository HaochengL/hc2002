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
def word_neighbors(word):
    AB = "abcdefghijklmnopqrstuvwxyz"  # the alphabet
    len_word = len(word)
    letters = list(AB)

    def gen_neighbors(i, char):
        res = []
        for new_char in letters:
            if char != new_char:
                res.append(word[:i] + new_char + word[i+1:])
        return fnlist_of_pylist(res)
    
    neighbor_list = stream_iforall(string_streamize(word), gen_neighbors)
    return stream_make_filter(neighbor_list, lambda s: s != "")

# The helper function to convert strcon to pylist
def strcon_to_pylist(fxs):
    result = []
    stream_foreach(fxs, lambda x: result.append(x))
    return result

# The function to convert python list to fnlist
def fnlist_of_pylist(lst):
    def helper(index):
        if index >= len(lst):
            return strcon_nil()
        else:
            return strcon_cons(lst[index], lambda: helper(index+1))
    return lambda: helper(0)

# The function to test word_neighbors
def test_word_neighbors():
    neighbors = word_neighbors("apple")
    pylist_neighbors = strcon_to_pylist(neighbors)
    print(pylist_neighbors)



    
test_word_neighbors()
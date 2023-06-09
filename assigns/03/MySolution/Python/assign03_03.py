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
    worklen = len(word)
    AB = "abcdefghijklmnopqrstuvwxyz"
    return fnlist_concat(
        string_imap_fnlist(
            word,
            lambda i, c: fnlist_concat(
                string_imap_fnlist(
                    AB,
                    lambda _, c1: fnlist_sing(
                        string_tabulate(worklen, lambda j: word[j] if i != j else c1)
                    )
                    if c != c1
                    else fnlist_nil(),
                )
            )
        )
    )

def string_implode(ss):
    return foreach_to_foldleft(fnlist_foreach)(
        ss, "", lambda r, s: r + s
    )
    
    
def fnlist_tabulate(n, f):
    return fnlist_reverse(
        int1_foldleft(n, fnlist_nil(), lambda xs, i: fnlist_cons(f(i), xs))
    )


def string_tabulate(n, f):
    return string_implode(fnlist_tabulate(n, f))


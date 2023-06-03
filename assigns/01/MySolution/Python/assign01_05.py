####################################################
import sys
sys.path.append('./../..')
from assign01_lib import *
####################################################
print("[import ./../assign01_lib.py] is done!")
####################################################
#
# Please implement (20 points)
# mylist_append (see list_append in assign01-lib.sml)
# mylist_rappend (see list_rappend in assign01-lib.sml)
# mylist_reverse (see list_reverse in assign01-lib.sml)
#
####################################################

def mylist_append(xs, ys):
    """
    Appends two lists, xs and ys, together.
    """
    return xs + ys

def mylist_rappend(xs, ys):
    """
    Appends two lists, xs and ys, together in reverse order.
    """
    return ys + xs

def mylist_reverse(xs):
    """
    Reverses the order of elements in a list, xs.
    """
    return xs[::-1]

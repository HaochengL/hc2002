####################################################
import sys
sys.path.append('./../../')
from assign01_lib import *
####################################################
print("[import ./../../assign01_lib.py] is done!")
####################################################
#
# Please implement (10 points)
# mylist_quicksort (see list_quicksort in assign01-lib.sml)
#
####################################################

def mylist_quicksort(xs):
    def qsort(xs):
        if mylist_nilq(xs):
            return xs
        else:
            x1 = xs.cons1
            xs = xs.cons2
            ys, zs = qpart(xs, x1)
            ys = qsort(ys)
            zs = qsort(zs)
            return mylist_append(mylist_append(ys, mylist_cons(x1, mylist_nil())), zs)
    
    def qpart(xs, p0):
        if mylist_nilq(xs):
            return mylist_nil(), mylist_nil()
        else:
            x1 = xs.cons1
            xs = xs.cons2
            ys, zs = qpart(xs, p0)
            if x1 <= p0:
                return mylist_cons(x1, ys), zs
            else:
                return ys, mylist_cons(x1, zs)
    
    return qsort(xs)

xs = mylist_nil()
xs = mylist_cons(2, xs)
xs = mylist_cons(4, xs)
xs = mylist_cons(3, xs)
xs = mylist_cons(1, xs)
xs = mylist_cons(3, xs)
xs = mylist_cons(4, xs)
xs = mylist_cons(2, xs)
xs = mylist_cons(1, xs)
xs = mylist_append(xs, xs)
xs = mylist_append(xs, xs)

print("xs = ", end='')
mylist_print(xs)
print()

ys = mylist_quicksort(xs)
print("ys = ", end='')
mylist_print(ys)
print()
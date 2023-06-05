import sys
sys.path.append('./../../')
from assign01_lib import *
from assign01_05 import *
####################################################
print("[import ./../../assign01_lib.py] is done!")

def append_lists(list1, list2):
    if mylist_nilq(list1):
        return list2
    elif mylist_nilq(list2):
        return list1
    else:
        current = list1
        while mylist_consq(current.get_cons2()):
            current = current.get_cons2()
        current.cons2 = list2
        return list1
    
xs = mylist_nil()
xs = mylist_cons(1, xs)
xs = mylist_cons(2, xs)
xs = mylist_cons(3, xs)
ys = mylist_nil()
ys = mylist_cons(4, ys)
ys = mylist_cons(5, ys)
ys = mylist_cons(6, ys)
mylist_print(xs)
mylist_print(ys)
zs = mylist_append(xs,ys)
mylist_print(zs)

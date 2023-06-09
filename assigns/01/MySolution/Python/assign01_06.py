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

    
#def mylist_quicksort(xs):
 #   def qsort(xs):
 #       if mylist_nilq(xs):
   #         return xs
 #       else:
  ##          x1 = xs.cons1
    #        xs = xs.cons2
   #         ys, zs = qpart(xs, x1)
   #         ys = qsort(ys)
   #         zs = qsort(zs)
   #         return mylist_append(mylist_append(ys, mylist_cons(x1, mylist_nil())), zs)
    
  #  def qpart(xs, p0):
  #      if mylist_nilq(xs):
   #         return mylist_nil(), mylist_nil()
  #      else:
    #        x1 = xs.cons1
   #         xs = xs.cons2
   #         ys, zs = qpart(xs, p0)
   #         if x1 <= p0:
   #             return mylist_cons(x1, ys), zs
   #         else:
    #            return ys, mylist_cons(x1, zs)
    
   # return qsort(xs)
    
def mylist_quicksort(xs):
    def qsort(xs):
        if mylist_nilq(xs):
            return mylist_nil()
        else:
            x1 = xs.get_cons1()
            xs = xs.get_cons2()
            ys,zs = qpart(xs,x1)
            ys = qsort(ys)
            zs = qsort(zs)

            return mylist_append(ys,mylist_cons(x1,zs))
        
    def qpart(xs,p0):
        if mylist_nilq(xs):
            return mylist_nil(), mylist_nil()
        else:
            x1 = xs.get_cons1()
            xs = xs.get_cons2()
            ys,zs = qpart(xs,p0)
            if x1 <= p0:
                return mylist_cons(x1, ys), zs
            else:
                return ys, mylist_cons(x1, zs)
    
    
    return qsort(xs)

def mylist_append(xs, ys):
    if mylist_nilq(xs):
        return ys
    elif mylist_consq(xs):
        return mylist_cons(xs.get_cons1(), mylist_append(xs.get_cons2(), ys))



(* ****** ****** *)

use "./../../assign01-lib.sml";

(* ****** ****** *)

(*
//
Assign01-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'xlist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'xlist_reverse'
3. 'xs' and 'ys' use the same number of 'xlist_append'
//
*)
  
(* ****** ****** *)

fun
xlist_remove_reverse
(xs: 'a xlist): 'a xlist = 
let
fun rmreverse(xs:'a xlist): 'a xlist = 
case xs of
  xlist_nil => xlist_nil
  |xlist_cons(x1, xs) => xlist_cons(x1,rmreverse(xs))
  |xlist_snoc(xs, x1) => xlist_snoc(rmreverse(xs),x1)
  |xlist_append(xs, ys) => xlist_append(rmreverse(xs),rmreverse(ys))
  |xlist_reverse(xs) => reverse(xs) and

reverse (xs:'a xlist):'a xlist =
  case xs of 
  xlist_nil =>xlist_nil
  |xlist_cons(x1,xs) => xlist_snoc(reverse(xs),x1)
  |xlist_snoc(xs,x1) => xlist_cons(x1,reverse(xs))
  |xlist_append(x1,x2) => xlist_append(reverse(x2),reverse(x1))
  |xlist_reverse(xs) => rmreverse(xs)
in
rmreverse(xs)
end




val xs1 = xlist_nil
val xs1 =xlist_snoc(xs1,2)
val xs1 = xlist_snoc(xs1,3)

val xs1 = xlist_append(xs1,xs1)


val xs1 = xlist_reverse(xs1)


val ys1 = xlist_remove_reverse(xs1)
val test1 = list_of_xlist(xs1)
val test2 = list_of_xlist(ys1)



					   
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-03.sml] *)

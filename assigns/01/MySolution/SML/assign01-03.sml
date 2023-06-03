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

fun xlist_remove_reverse (xs: 'a xlist): 'a xlist =
  case xs of
    xlist_nil => xlist_nil
  | xlist_cons (x1, xs') => xlist_cons (x1, xlist_remove_reverse xs')
  | xlist_snoc (xs', x1) => xlist_snoc (xlist_remove_reverse xs', x1)
  | xlist_append (xs1, xs2) =>
      xlist_append (xlist_remove_reverse xs1, xlist_remove_reverse xs2)
  | xlist_reverse xs' =>
      case xs' of
        xlist_nil => xlist_nil
      | xlist_cons (x1, xs'') => xlist_snoc (xlist_remove_reverse xs'', x1)
      | xlist_snoc (xs'', x1) => xlist_cons (x1, xlist_remove_reverse xs'')
      | xlist_append (xs1, xs2) =>
          xlist_append (xlist_remove_reverse xs2, xlist_remove_reverse xs1)
      | xlist_reverse xs'' => xlist_remove_reverse xs''






					   
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-03.sml] *)

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

fun xlist_remove_reverse(xs: 'a xlist): 'a xlist =
  let
    fun reverseHelper(xs: 'a xlist, acc: 'a xlist): 'a xlist =
      case xs of
        xlist_nil => acc
      | xlist_cons(x1, xs) => reverseHelper(xs, xlist_cons(x1, acc))
      | xlist_snoc(xs, x1) => reverseHelper(xs, xlist_snoc(acc, x1))
      | xlist_append(xs1, xs2) => xlist_append(reverseHelper(xs2, acc), reverseHelper(xs1, xlist_nil))
      | xlist_reverse(xs) => reverseHelper(xs, acc)

    fun removeReverseHelper(xs: 'a xlist, acc: 'a xlist): 'a xlist =
      case xs of
        xlist_nil => acc
      | xlist_cons(x1, xs) => xlist_cons(x1, removeReverseHelper(xs, acc))
      | xlist_snoc(xs, x1) => removeReverseHelper(xs, xlist_snoc(acc, x1))
      | xlist_append(xs1, xs2) => xlist_append(removeReverseHelper(xs1, acc), removeReverseHelper(xs2, acc))
      | xlist_reverse(xs) => removeReverseHelper(reverseHelper(xs, xlist_nil), acc)

  in
    removeReverseHelper(xs, xlist_nil)
  end


					   
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-03.sml] *)

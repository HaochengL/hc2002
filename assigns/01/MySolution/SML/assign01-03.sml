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
    fun removeReverseHelper(xs: 'a xlist, acc: 'a xlist): 'a xlist =
      case xs of
        xlist_nil => acc
      | xlist_cons(x1, xs) => xlist_cons(x1, removeReverseHelper(xs, acc))
      | xlist_snoc(xs, x1) => removeReverseHelper(xs, xlist_snoc(acc, x1))
      | xlist_append(xs1, xs2) =>
          let
            val ys1 = removeReverseHelper(xs1, xlist_nil)
            val ys2 = removeReverseHelper(xs2, xlist_nil)
          in
            appendHelper(ys1, ys2, acc)
          end
      | xlist_reverse(xs) => removeReverseHelper(xs, acc)

    and appendHelper(xs1: 'a xlist, xs2: 'a xlist, acc: 'a xlist): 'a xlist =
      case xs1 of
        xlist_nil => xs2
      | xlist_cons(x1, xs) => xlist_cons(x1, appendHelper(xs, xs2, acc))
      | xlist_snoc(xs, x1) => appendHelper(xs, xlist_snoc(acc, x1), acc)
      | xlist_append(xs1', xs2') => appendHelper(xs1', xs2', appendHelper(xs2, acc, acc))
      | xlist_reverse(xs) => appendHelper(xs, acc, acc)
  in
    removeReverseHelper(xs, xlist_nil)
  end





					   
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-03.sml] *)

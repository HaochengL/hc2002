(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-06-05: 10 point
The function [list_subsets]
returns all the subsets of a given
set (where sets are represented as lists)
//
fun
list_subsets
(xs: 'a list): 'a list list =
(
case xs of
  nil => [[]]
| x1 :: xs =>
  let
    val res = list_subsets(xs)
  in
    res @ list_map(res, fn(xs) => x1 :: xs)
  end
)
//
Please give a NON-RECURSIVE implementation of
list_subsets based on list-combinators. Note that
the order of the elements in a list representation
of a set is insignificant.
//
*)
(* ****** ****** *)

(*
val
list_subsets =
fn(xs: 'a list) => ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-06.sml] *)

fun list_subsets(xs: 'a list): 'a list list =
    let
        fun subsets([], acc) = acc
        | subsets(x::xs, acc) =
            let
                val subsets = subsets(xs, acc)
                val subsetsprepend = mapacc(subsets, fn (subset, res) => (x :: subset) :: res, [])
            in
                subsets @ subsetsprepend
            end

        and mapacc([], _, acc) = acc
        | mapacc(x::xs, f, acc) =
            let
                val result = f(x, acc)
            in
                mapacc(xs, f, result)
            end
    in
        subsets(xs, [[]])
    end


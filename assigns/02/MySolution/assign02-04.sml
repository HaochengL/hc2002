(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-04.sml] *)


fun list_longest_ascend(xs: int list): int list =
  let
    fun compare([], longest) = current(longest)
      | compare(x::xs1, []) = compare(xs1, x::xs1)
      | compare(x::xs1, longest) =
          if list_length(current(longest)) >= list_length(current(x::xs1))
          then compare(xs1, longest)
          else compare(xs1, x::xs1)
  in
    compare(xs,[])
  end


val l1st = list_longest_ascend([1,2,3,4,5])
val l2st = list_longest_ascend([5,4,3,2,1])
val l3st = list_longest_ascend([2, 1, 3, 3, 4, 4, 5])
val l4st = list_longest_ascend([2, 1, 1, 3, 3, 2, 4, 4, 5])
val l5st = list_longest_ascend([2, 1, 2, 1, 3, 3, 2, 2, 4, 3, 4, 5, 3, 5])
val l6st = list_longest_ascend([4, 1, 2, 1, 3, 8, 9, 5, 6, 7, 1, 1, 1, 1, 1, 1, 1])

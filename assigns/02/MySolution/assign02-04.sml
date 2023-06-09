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
    fun helper([], _, longest, current) =
      if list_length(current) > list_length(longest)
      then current
      else longest
      | helper(x::xs', prev, longest, current) =
      if x >= prev
      then
        let
          val longest_cont = helper(xs', x, longest, list_append(current,[x]))
          val longest_skip = helper(xs', prev, longest, current)
        in
          if list_length(longest_cont) >= list_length(longest_skip)
          then longest_cont
          else longest_skip
        end
      else
        let
          val longest_skip = helper(xs', x, longest, [x])
        in
          if list_length(longest_skip) > list_length(current)
          then longest_skip
          else helper(xs', prev, longest, current)
        end
  in
    case xs of
      [] => []
    | x::xs' => helper(xs', x, [], [x])
  end









val l1st = list_longest_ascend([1,2,3,4,5])
val l2st = list_longest_ascend([5,4,3,2,1])
val l3st = list_longest_ascend([2, 1, 3, 3, 4, 4, 5])
val l4st = list_longest_ascend([2, 1, 1, 3, 3, 2, 4, 4, 5])
val l5st = list_longest_ascend([2, 1, 2, 1, 3, 3, 2, 2, 4, 3, 4, 5, 3, 5])
val l6st = list_longest_ascend([4, 1, 2, 1, 3, 8, 9, 5, 6, 7, 1, 1, 1, 1, 1, 1, 1])
val l7st = list_longest_ascend([1,1,1,3,2,3,4,5,6,7,1,1])

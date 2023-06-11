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

fun find_longest (prev: int, nil) : int list = []
  | find_longest (prev, x1::xs) : int list =
      if x1 >= prev
      then x1 :: find_longest (prev, xs)
      else find_longest (prev, xs)


fun list_longest_ascend (xs: int list) : int list =
    case xs of
        nil => []
      | x1::xs =>
        let
          val current = x1 :: list_longest_ascend (find_longest (x1, xs))
          val remain = list_longest_ascend(xs)
        in
          if list_length(current) >= list_length(remain)
          then current
          else remain
        end




val e = [2, 1, 2, 1, 3, 3, 2, 2, 4, 3, 4, 5, 3, 5]

val myans7 = list_longest_ascend e
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


fun insert(res, x1) =
    case list_reverse res of
        [] => [x1]
      | y::ys =>
        if x1 >= y then res @ [x1]
        else insert(list_reverse(ys), x1)

fun find_index(x: int, xs: int list): int =
  let
    fun helper(y, i, []) = ~1
      | helper(y, i, z::zs) = if z = y then i else helper(y, i+1, zs)
  in
    helper(x, 0, xs)
  end

fun list_longest_ascend(xs: int list): int list =
  let
    fun helper(low, xs, res, prev, original) = 
      case xs of 
        [] => res
      | x1::xs1 =>
        if x1 >= prev then
          let 
            val keep = helper(low, xs1, res @ [x1], x1, original)
            val drop = helper(low, xs1, res, List.last res, original)
          in
            if length keep >= length drop then keep
            else drop
          end
        else if x1 < low then
          let
            val keep = helper(x1, xs1, [x1], x1, original)
            val drop = helper(low, xs1, res, List.last res, original)
          in
            if length keep > length drop then keep
            else if length keep < length drop then drop
            else if find_index(x1, original) > find_index(List.hd keep, original) then keep
            else drop
          end
        else
          let
            val inserted = insert(res, x1)
            val keep = helper(low, xs1, inserted, List.last inserted, original)
            val drop = helper(low, xs1, res, List.last res, original)
          in
            if length keep > length drop then keep
            else drop
          end
  in
    case xs of
      [] => []
    | x1::xs1 => helper(x1, xs1, [x1], x1, xs)
  end


val l1st = list_longest_ascend([2, 1, 2, 1, 3, 3, 2, 2, 4, 3, 4, 5, 3, 5])

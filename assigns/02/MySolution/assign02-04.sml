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


fun helper(xs: int list): int list = 
    case xs of
        [] => []  
      | [x] => [x]  
      | x1::x2::xs =>
            if x2 >= x1 then x1::helper(x2::xs) 
            else helper(x1::xs)

fun list_longest_ascend(xs: int list): int list =
  let
    fun longest_helper([], x1, longest, current, first) =
      if list_length(first) = list_length(current) then first
      else if list_length(current) > list_length(longest)
      then current
      else longest
      | longest_helper(x1::xs, previous, longest, current, first) =
      if x1 >= previous
      then
        let
          val use = longest_helper(xs, x1, longest, list_append(current,[x1]), first)
          val skip = longest_helper(xs, previous, longest, current, first)
        in
          if list_length(use) >= list_length(skip)
          then use
          else skip
        end
      else
        let
          val skip = longest_helper(xs, x1, longest, [x1], first)
        in
          if list_length(skip) > list_length(current)
          then skip
          else longest_helper(xs, previous, longest, current, first)
        end
  in 
    let
      val first = helper(xs)
    in
      case xs of
        [] => []
      | x1::xs => longest_helper(xs, x1, [], [x1], first)
    end
  end


val l1st = list_longest_ascend([2, 1, 3, 3, 4, 4, 5])

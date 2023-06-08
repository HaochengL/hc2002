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


fun count_occurrences (x, []) = 0
  | count_occurrences (x, y::ys) =
    if x = y then 1 + count_occurrences (x, ys)
    else count_occurrences (x, ys)

fun replicate (n, x) =
    if n <= 0 then []
    else x :: replicate (n-1, x)

fun check(new: int list, xs: int list, original: int list): int list =
  if new = [] then []
  else if list_head(new) = list_last(new)
    then replicate(count_occurrences(list_head(new), original), list_head(new))
  else new


fun current(xs: int list, original: int list): int list =
  let
    fun helper([], longest, original) = longest
      | helper(x::xs', [], original) = helper(xs', [x], original)
      | helper(x::xs', longest as last::_, original) =
          if x >= last
          then helper(xs', x::longest, original)
          else helper(xs', longest, original)
  in
    
    check(list_reverse(helper(xs, [], original)), xs, original)

  end

fun list_longest_ascend(xs: int list): int list =
  let
    fun compare([], longest,original) = current(longest,original)
      | compare(x::xs1, [], original) = compare(xs1, x::xs1, original)
      | compare(x::xs1, longest, original) =
          if list_length(current(longest, original)) >= list_length(current(x::xs1, original))
          then compare(xs1, longest, original)
          else compare(xs1, x::xs1, original)
  in
    compare(xs,[], xs)
  end


val l1st = list_longest_ascend([1,2,3,4,5])
val l2st = list_longest_ascend([5,4,3,2,1])
val l3st = list_longest_ascend([2, 1, 3, 3, 4, 4, 5])
val l4st = list_longest_ascend([2, 1, 1, 3, 3, 2, 4, 4, 5])
val l5st = list_longest_ascend([2, 1, 2, 1, 3, 3, 2, 2, 4, 3, 4, 5, 3, 5])
val l6st = list_longest_ascend([4, 1, 2, 1, 3, 8, 9, 5, 6, 7, 1, 1, 1, 1, 1, 1, 1])

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


fun find_index(x: int, xs: int list): int =
  let
    fun helper(y, i, []) = ~1
      | helper(y, i, z::zs) = if z = y then i+1 else helper(y, i+1, zs)
  in
    helper(x, 0, xs)
  end

fun longest_helper([], x1, longest, current, origin) =
      if list_length(current) > list_length(longest)
      then current
      else if list_length(current) = list_length(longest)
      then (if find_index(list_head(longest), origin) <= find_index(list_head(current), origin)
            then longest
            else current)
      else longest
      | longest_helper(x1::xs, previous, longest, current, origin) =
      if x1 >= previous
      then
        let
          val use = longest_helper(xs, x1, longest, list_append(current, [x1]), origin)
          val skip = longest_helper(xs, previous, longest, current, origin)
        in
          if list_length(use) >= list_length(skip)
          then use
          else skip
        end
      else
        let
          val skip = longest_helper(xs, x1, longest, [x1], origin)
        in
          if list_length(skip) > list_length(current)
          then skip
          else if list_length(skip) = list_length(current)
          then (if find_index(list_head(skip), origin) <= find_index(list_head(current), origin)
            then skip
            else current)
          else longest_helper(xs, previous, longest, current, origin)
        end


fun list_longest_ascend(xs: int list): int list =
    let
      val origin = xs
    in
      case xs of
        [] => []
      | x1::xs => longest_helper(xs, x1, [], [x1], origin)
    end

val l1st = list_longest_ascend([2, 1, 3, 3, 4, 4, 5])





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
(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-02: midterm-06: 20 points
//
Given a list of integers xs, list_grouping(xs)
returns a list of pairs (n, x) where n indicates
the number of times x occurs in xs; for each x in
xs, there must be a pair (n, x) for some n in the
returned list.
//
For instance,
list_grouping([1,2]) = [[1,1], [1,2]]
list_grouping([1,2,2,2,1]) = [[2,1], [3,2]]
list_grouping([1,2,1,2,3]) = [[2,1], [2,2], [1,3]]
//
In order to receive full credit, your implementation
should be able to handle a list containing 1M elements
in less than 10 seconds (mine can do it in less than
two seconds)
//
*)
(* ****** ****** *)
(*
IF YOU WANT TO SORT A LIST, YOU MUST IMPLEMENT
SOME SORTING FUNCTION ON YOUR OWN. Your implementation
is not allowed to make use of library functions except
those in the library for this class.
*)
(* ****** ****** *)
(*
fun
list_grouping(xs: int list): (int * int) list = ...
*)
(* ****** ****** *)
(*
(*
Some testing code:
*)
val N = 1000
val nxs =
list_grouping(list_map(list_fromto(0, N), fn i => N-i))
*)
(* ****** ****** *)
(*
(*
Some testing code:
*)
Your implementation needs to be efficient to pass the
following test:
val N = 1000000
val nxs = list_grouping(int1_map_list(N, fn i => N-i))
*)
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-list_grouping.sml] *)


fun split xs =
  let
    fun split_helper [] = ([], [])
      | split_helper [x] = ([x], [])
      | split_helper (x1::x2::xs) =
          let val (ys, zs) = split_helper xs
          in  (x1::ys, x2::zs) 
          end
  in
    split_helper xs
  end;

fun merge (xs, ys) =
  case xs of
    [] => ys
  | x::xs' =>
      (case ys of
         [] => xs
       | y::ys' =>
           if x <= y then x::merge (xs', ys)
           else y::merge (xs, ys'));

fun mergesort xs =
  case xs of
    [] => []
  | [x] => xs
  | _ =>
    let val (xs1, xs2) = split xs
    in  merge (mergesort xs1, mergesort xs2) 
    end;

fun count_list xs =
  let
    fun count_helper [] n prev = [(n, prev)]
      | count_helper (x::xs) n prev =
          if x = prev then count_helper xs (n+1) x
          else (n, prev)::count_helper xs 1 x
  in
    case xs of
      [] => []
    | x::xs' => count_helper xs' 1 x
  end;

fun list_grouping xs =
  let
    val sorted = mergesort xs
  in
    count_list sorted
  end;

val xs = list_grouping([1,2])
val ys = list_grouping([1,2,2,2,1])
val zs = list_grouping([1,2,1,2,3])

(* ****** ****** *)

use "./../../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)
(*
HX-2023-02-07: 60 points
*)
(* ****** ****** *)

type int2 = int * int
type int3 = int * int * int
type int4 = int * int * int * int
type int5 = int * int * int * int * int
(* ****** ****** *)

(*
The following function int5_sort
is based on ListMergeSort.sort, which is
defined recursively. Given a tuple of 5
integers, int5_sort returns an ordered tuple
of the same 5 integers. For instance,
int5_sort(1, 2, 1, 2, 2) = (1, 1, 2, 2, 2)
int5_sort(3, 1, 2, 5, 2) = (1, 2, 2, 3, 5)
int5_sort(3, 1, 2, 5, 4) = (1, 2, 3, 4, 5)
*)

(*
val
int5_sort =
fn(xs: int5): int5 =
let
val (x1, x2, x3, x4, x5) = xs
val ys =
ListMergeSort.sort(op>=)[x1,x2,x3,x4,x5]
val y1 = hd(ys) and ys = tl(ys)
val y2 = hd(ys) and ys = tl(ys)
val y3 = hd(ys) and ys = tl(ys)
val y4 = hd(ys) and ys = tl(ys)
val y5 = hd(ys) and ys = tl(ys)
in
  (y1, y2, y3, y4, y5)
end
*)

(* ****** ****** *)
(*
Please give a non-recursive implementation of int5_sort
as int5_sort_nr. That is, please implement int5_sort_nr
in a non-recursive manner such that int5_sort(xs) equals
int5_sort_nr(xs) for every 5-tuple xs of the type int5.
*)
(* ****** ****** *)

(*val
int2_sort_nr =
fn(xs: int2): int2 => raise NotImplemented320*)


val int2_sort_nr =
fn(xs: int2): int2 =>
let
    val (x1, x2) = xs
in
    if x1 <= x2 then (x1,x2) else (x2,x1)
end

(* ****** ****** *)

(*val
int3_sort_nr =
fn(xs: int3): int3 => raise NotImplemented320*)

val int3_sort_nr =
fn (xs: int3): int3 =>
let
  val (x1, x2, x3) = xs
  val (a, b) = int2_sort_nr(x1, x2)
  val (c, d) = int2_sort_nr(b, x3)
  val (e, f) = int2_sort_nr(a, c)
in
  (e, f, d)
end 


(* ****** ****** *)

(*val
int4_sort_nr =
fn(xs: int4): int4 => raise NotImplemented320*)

val int4_sort_nr =
fn(xs: int4): int4 =>
let
    val (x1, x2, x3, x4) = xs

    val (a, b) = int2_sort_nr(x1, x2)
    val (c, d) = int2_sort_nr(x3, x4)
    val (e, f) = int2_sort_nr(a, c)
    val (g, h) = int2_sort_nr(b, d)

in
    if f > g then
        (e, g, f, h)
    else if g > f then
        (e, f, g, h)
    else
        (e, f, g, h)
end


(* ****** ****** *)

(*val
int5_sort_nr =
fn(xs: int5): int5 => raise NotImplemented320*)

val int5_sort_nr =
fn (xs: int5): int5 =>
let
  val (x1, x2, x3, x4, x5) = xs

  val (a,b,c,d) = int4_sort_nr(x1,x2,x3,x4)
  val (e,f,g,h) = int4_sort_nr(b,c,d,x5)

in
    if a>e then
        (e,a,f,g,h)
    else if e>a then
        (a,e,f,g,h)
    else
        (e,a,f,g,h)

end



(* ****** ****** *)

(* end of [CS320-2023-Sum1-quiz01-int5_sort_nonrec.sml] *)

(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-06: 10 points
Please use int1_foldleft to implement
the following functions list_factorials
which, when applied to an integer n, returns
a list consisting the first n factorial numbers.
For instance, we have
list_factorials(0) = []
list_factorials(5) = [1, 1, 2, 6, 24 ]
list_factorials(6) = [1, 1, 2, 6, 24, 120]
PLEASE NOTE THAT YOU CANNOT DEFINE RECURSIVE
FUNCTIONS IN YOUR IMPLEMENTATION. If you do,
your implementation is disqualified.
*)
(*
fun list_factorials(n: int): int list = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-list_factorials.sml] *)
fun list_factorials(n: int): int list =
    let
        val lenfact = if n > 1 then n - 1 else 0
        val begin = (1, [1]) 
        val (_, currfact) = int1_foldleft(lenfact, begin, 
            fn((prod, begin), _) => let val new = prod * list_length(begin) in (new, begin @ [new]) end)
    in
        case n of 
            0 => []
            |1 => [1]
            |n => currfact
    end

val d = list_factorials(1)
val c = list_factorials(0)
val b = list_factorials(5)
val a = list_factorials(6)


(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)
(*
fun
find_root(f0: int -> int): int = ...
*)
fun find_root(f0: int -> int): int =
    let
        fun helper i =
            if f0 i = 0 then i
            else if f0 (~i) = 0 then ~i
            else helper (i+1)
    in
        helper 0
    end;



(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-01.sml] *)

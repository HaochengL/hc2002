(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-10: 10 points
The function list_tabulate takes an integer
[n] and a function [f] and returns a list that
equals [f(0), f(1), ..., f(n-1)]
//
list_tabulate(n: int, f: int -> 'a): 'a list
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-03.sml] *)
fun list_tabulate(n: int, f: int -> 'a): 'a list =
    let
        val count = 0
        fun loop(count: int): 'a list =
            if n = 0 then []
            else if count = n then []
            else f(count) :: loop(count + 1)
    in
        loop(count)
    end


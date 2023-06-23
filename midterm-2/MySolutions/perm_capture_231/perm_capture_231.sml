(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence of in satisfying
c < a < b. Note that a, b, and c doe not have
to appear consecutively in xs.

For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
*)

(* ****** ****** *)

(*
fun
perm_capture_231
(xs: int list): bool = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-perm_capture_231.sml] *)

fun perm_capture_231(xs: int list): bool =
    let
        fun check_231(a, b, c) = c < a andalso a < b
        fun helper(xs) =
            case xs of
                [] => false
            |   a::xs' =>
                    let
                        fun scan([], _) = helper(xs')
                        |   scan(b::bs, []) = helper(xs')
                        |   scan(b::bs, c::cs) =
                            if b > a andalso list_exists(bs, fn c => c < a)
                            then true
                            else scan(bs, cs)
                    in
                        scan(xs', xs')
                    end
    in
        helper(xs)
    end
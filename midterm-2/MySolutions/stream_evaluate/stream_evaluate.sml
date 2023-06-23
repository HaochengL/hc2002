(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
Given a stream fxs of real numbers a0, a1, a2, ...
and a real number x0, stream_evaluate(fxs, x0)
returns another stream of real number that enumerates
all of the following partial sums:
a0, a0 + a1*x0, a0 + a1*x0 + a2*x0^2, ...
The general form of the enumerated sums is given as follows
(a0 + a1*x0 + a2*x0^2 + ... + an * x0^n)
*)

(* ****** ****** *)

(*
fun
stream_evaluate
( fxs
: real
  stream
, x0: real): real stream = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-stream_evaluate.sml] *)

fun
stream_evaluate
(fxs: real stream, x0: real): real stream =
let
  fun
  helper
  (fxs: real stream, xpow: real, sum: real): real stream = fn () =>
  (
  case fxs() of
    strcon_nil => strcon_nil
  | strcon_cons(a, fxs) =>
    let
      val new_sum = sum + a * xpow
    in
      strcon_cons(new_sum, helper(fxs, xpow * x0, new_sum))
    end
  )
  
in
  helper(fxs, 1.0, 0.0)
end
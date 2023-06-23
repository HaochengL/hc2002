(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
fun
stream_drop(fxs, n) = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_drop.sml] *)

fun
stream_drop
(fxs: 'a stream, n: int): 'a stream = fn() =>
if n <= 0 then fxs()
else
(
  case fxs() of
    strcon_nil => strcon_nil
  | strcon_cons(_, fxs) => stream_drop(fxs, n - 1)()
)
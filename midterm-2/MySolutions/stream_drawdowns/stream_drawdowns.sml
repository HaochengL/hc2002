(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
// A non-empty sequence of numbers forms a
// "drawdown" if every number in the sequence does not
// exceed the first one. A maximal drawdown is one that
// is not contained in any longer drawdowns.
// Please implement a function stream_drawdowns that takes
// a stream fxs of integers and returns a stream consisting
// of all the maximal drawdowns in fxs.
//
*)

(* ****** ****** *)

(*
fun
stream_drawdowns
(fxs: int stream): int list stream = ...
*)
  
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-stream_drawdowns.sml] *)

fun
aux
  ( acc: int list
  , fxs: int stream): int list strcon =
(
case fxs() of
  strcon_nil => strcon_cons(acc, fn () => strcon_nil)
| strcon_cons(x1, fxs) =>
  if list_is_nil(acc) orelse x1 <= list_head(acc) then
    aux(x1::acc, fxs)
  else
    strcon_cons(list_reverse(acc), fn () => aux([x1], fxs))
)


fun
stream_drawdowns(fxs: int stream): int list stream = fn () =>
(
case fxs() of
  strcon_nil => strcon_nil
| strcon_cons(x1, fxs) => aux([x1], fxs)
)
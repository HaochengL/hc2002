(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-08.sml] *)

fun isStreamEmpty stream =
  case stream () of
    strcon_nil => true
  | _ => false

fun getHead stream = 
  case stream () of
    strcon_nil => []
  | strcon_cons(head, _) => head

fun getTail stream = 
  case stream () of
    strcon_nil => raise Empty
  | strcon_cons(_, tail) => tail

fun stream_ziplst streams = 
  if List.all isStreamEmpty streams then
    fn () => strcon_nil
  else
    let
      val heads = List.map getHead streams
      val tails = List.map getTail streams
    in
      fn () => strcon_cons(heads, stream_ziplst tails)
    end





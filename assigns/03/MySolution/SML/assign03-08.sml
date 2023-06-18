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

fun stream_ziplst(fxss) =
  let
    val length = stream_length(list_head(fxss))
  in
    stream_tabulate(length, fn i =>
      list_map(fxss, fn xs => stream_get_at(xs, i)))
  end




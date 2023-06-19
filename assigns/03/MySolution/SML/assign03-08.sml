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

fun stream_ziplst (xs: 'a stream list): 'a list stream = 
    fn () =>
        let
            val current = list_map(xs, fn x => x())
        in
            if list_exists(current, fn strcon => 
                case strcon of 
                strcon_nil => true
              | _ => false
            )then strcon_nil

            else 
                let 
                    val hd = list_map(current, fn strcon => 
                        case strcon of 
                        strcon_nil => raise Empty
                      | strcon_cons (h, _) => h)

                    val tl = list_map(current, fn strcon => 
                        case strcon of
                        strcon_nil => raise Empty
                      | strcon_cons (_, t) => t)

                in
                    strcon_cons (hd, stream_ziplst(tl))
                end
        end


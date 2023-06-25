(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-19: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign04-01.sml] *)

(* Insert 'x' at all possible positions of 'xs' *)

fun stream_permute_list(xs: 'a list): 'a list stream =
    let
        (* Helper function to insert an element at all positions in a list *)
        fun insert_all_positions x xs =
            let
                fun aux pre [] = [List.rev pre @ [x]]
                  | aux pre (h::t) = (List.rev pre @ (x::h::t)) :: aux (h::pre) t
            in
                aux [] xs
            end
        
        (* Helper function to compute permutations recursively *)
        fun permute xs =
            case xs of
                [] => list_streamize [[]]
              | x::xs' => stream_flatmap (permute xs') (fn p => list_streamize (insert_all_positions x p))
        
        (* Helper function to flatten a stream of streams *)
        and stream_flatmap (xs: ('a list) stream) (f: 'a list -> ('a list) stream) =
            fn () =>
                case xs() of
                    strcon_nil => strcon_nil
                  | strcon_cons(h, t) => strcon_append (f h, stream_flatmap t f)
        
        (* Helper function to append two streams *)
        and strcon_append (xs: 'a list stream, ys: 'a list stream) =
            case xs() of
                strcon_nil => ys()
              | strcon_cons(x1, xs') => strcon_cons(x1, fn () => strcon_append(xs', ys))
    in
        permute xs
    end



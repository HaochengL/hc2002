(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 10 points
Please enumerate all the pairs of natural
numbers. Given pairs (i1, j1) and (i2, j2),
(i1, j1) should be enumerated ahead of (i2, j2)
if i1+j1 < i2+j2.
*)

(* ****** ****** *)

(*
val theNatPairs: (int*int) stream = fn () =>  ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-05.sml] *)

local
    fun generate_pairs n =
        let
            fun loop n = 
                if n >= 0
                then strcon_cons((0, n), fn() => loop(n+1))
                else strcon_nil
        in
            fn () => loop n
        end

    fun merge str1 str2 = 
        case (stream_head str1, stream_head str2) of
            ((i1, j1), (i2, j2)) =>
                if i1 + j1 <= i2 + j2
                then strcon_cons((i1, j1), fn() => merge (stream_tail str1) str2)
                else strcon_cons((i2, j2), fn() => merge str1 (stream_tail str2))
in
    fun enumerate_pairs () = merge (generate_pairs 0) (enumerate_pairs ())
end


val theNatPairs: (int*int) stream = enumerate_pairs










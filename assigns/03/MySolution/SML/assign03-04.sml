(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)

(*
val the_ln2_stream: real stream = fn() => ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-04.sml] *)


(* ****** ****** *)

(* ****** ****** *)

(* ****** ****** *)

(* ****** ****** *)    
fun term(i: int): real = 
    if i mod 2 = 0 then 1.0 / real(i+1)
    else ~1.0 / real(i+1)

fun helper(i: int, current_sum: real): real stream = 
    let 
        val next_term = term(i)
        val new_sum = current_sum + next_term
    in 
        fn () => strcon_cons(new_sum, helper(i+1, new_sum))
    end

val the_ln2_stream: real stream = helper(0, 0.0)











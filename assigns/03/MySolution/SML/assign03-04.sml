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
fun compute_term(index: int): real = 
    if index mod 2 = 0 then 
        1.0 / real(index + 1)
    else 
        ~1.0 / real(index + 1)

fun construct_stream(counter: int, sum: real): real stream = 
    let 
        val next_value = compute_term(counter)
        val updated_sum = sum + next_value
    in 
        fn () => strcon_cons(updated_sum, construct_stream(counter + 1, updated_sum))
    end

val the_ln2_stream: real stream = construct_stream(0, 0.0)












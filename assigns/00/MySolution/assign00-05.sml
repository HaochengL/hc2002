(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

fun
stringrev
(cs: string): string = 

(* ****** ****** *)
let
    fun helper(i0: int): string = 
        if i0 <= 0 then "" else
        String.str(String.sub(cs, i0-1)) ^ helper(i0-1)
in 
    helper(String.size(cs))
end

val rever = stringrev("Eason")

(* end of [CS320-2023-Spring-assign00-05.sml] *)
 
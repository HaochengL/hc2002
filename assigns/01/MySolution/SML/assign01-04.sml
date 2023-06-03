(* ****** ****** *)

use "./../../assign01-lib.sml";

(* ****** ****** *)

(*
//
Assign01-04: 10 points
//
Please recall the following question in Assign00:
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)

(* ****** ****** *)

fun str2int_opt(cs: string): IntInf.int option =
  let
    fun isDigit(c: char): bool =
      Char.ord(c) >= Char.ord(#"0") andalso Char.ord(c) <= Char.ord(#"9")

    fun helper(i: int, count: IntInf.int): IntInf.int option =
      if i = String.size(cs) then SOME count
      else
        let
          val c = String.sub(cs, i)
        in
          if isDigit(c) then
            let
              val digit = IntInf.fromInt(Char.ord(c) - Char.ord(#"0"))
              val newCount = IntInf.*(count, IntInf.fromInt(10)) + digit
            in
              helper(i + 1, newCount)
            end
          else
            NONE
        end
  in
    if String.size(cs) > 0 then
      helper(0, IntInf.fromInt(0))
    else
      NONE
  end


val x1 = str2int_opt("12345")
val x2 = str2int_opt("1 5")
val x3 = str2int_opt("1")
val x4 = str2int_opt(" ")
val x5 = str2int_opt("1s")
val x6 = str2int_opt("00001123456789")


						
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-04.sml] *)

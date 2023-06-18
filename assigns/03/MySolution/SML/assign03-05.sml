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

val theNatPairs: (int * int) stream = fn () =>
  let
    fun theNatPairs_aux(i: int, j: int): (int * int) strcon =
      case i of
        0 => strcon_cons((0, j), fn() => theNatPairs_aux(j + 1, 0))
      | _ =>
          case j of
            0 => strcon_cons((i, j), fn() => theNatPairs_aux(i - 1, j + 1))
          | _ => strcon_cons((i, j), fn() => theNatPairs_aux(i - 1, j + 1))
  in
    theNatPairs_aux(0, 0)
  end











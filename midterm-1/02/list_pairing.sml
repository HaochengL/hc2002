(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-02: 10 points
*)
(* ****** ****** *)
(*
Given a list xs, list_pairing(xs) returns
a list of pairs and an option; the 1st pair
consists of the first and last elements in xs,
and the 2nd pair consists of the second and the
second last elements in xs, and so on and so forth;
and the option is NONE if |xs| is even, and it is
SOME(xm) if |xs| is odd and xm is the middle element
in xs.
//
For instance, we have:
//
list_pairing([]) = ([], NONE)
list_pairing([1]) = ([], SOME(1))
list_pairing([1,2]) = ([(1,2)], NONE)
list_pairing([1,2,3]) = ([(1,3)], SOME(2))
list_pairing([1,2,3,4]) = ([(1,4),(2,3)], NONE)
//
Yes, you can define recursive functions in your
implementation.
//
*)
(* ****** ****** *)
(*
fun
list_pairing
(xs: 'a list): ('a * 'a) list * 'a option = ...
*)
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-list_pairing.sml] *)


(*fun list_pairing(xs: 'a list): ('a * 'a) list * 'a option =
  let
    fun pairing(acc, []) = (acc, NONE)
      | pairing(acc, [x]) = (acc, SOME x)
      | pairing(acc, x1 :: rest) =
          let
            val x2 = list_last(rest)
            val pairs = acc @ [(x1, x2)]
            val (newPairs, middle) = pairing(pairs, list_reverse (list_tail((list_reverse(rest)))))
          in
            (newPairs, middle)
          end
  in
    pairing([], xs)
  end*)

fun list_pairing (xs: 'a list): ('a * 'a) list * 'a option =
  let
    val size = list_length(xs)
    val ys = list_reverse(xs)

    fun even (xs: 'a list, ys: 'a list, counter: int): ('a * 'a) list =
      if counter <> 0 then
        case xs of
          [] => []
        | x1 :: xs =>
            let
              val (y1 :: ys) = ys
            in
              (x1, y1) :: even(xs, ys, counter - 2)
            end
      else []

    fun odd (xs: 'a list, ys: 'a list, counter: int): ('a * 'a) list =
      if counter <> 0 then
        case xs of
          [] => []
        | x1 :: xs =>
            let
              val (y1 :: ys) = ys
            in
              (x1, y1) :: odd(xs, ys, counter - 2)
            end
      else []

    fun opt (xs: 'a list, counter: int, index: int): 'a option =
      case xs of
        [] => NONE
      | x1 :: xs =>
          if counter = index then SOME(x1)
          else opt(xs, counter + 1, index)

  in
    if size mod 2 = 1 then
      (odd(xs, ys, size - 1), opt(xs, 0, size div 2))
    else
      (even(xs, ys, size), NONE)
  end




val xs = [1,2,3,4,5,6,7]
val (r, option) = list_pairing(xs)
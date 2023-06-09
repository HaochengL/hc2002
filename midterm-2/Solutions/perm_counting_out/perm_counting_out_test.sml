(* ****** ****** *)

use "./perm_counting_out.sml";

(* ****** ****** *)

val () =
assert320(perm_counting_out([1,2,3], 0) = [1,2,3])
val () =
assert320(perm_counting_out([1,2,3], 1) = [2,1,3])
val () =
assert320(perm_counting_out([1,2,3], 2) = [3,1,2])
val () =
assert320(perm_counting_out([1,2,3], 3) = [1,3,2])
val () =
assert320(perm_counting_out([1,2,3,4], 1) = [2,4,3,1])
val () =
assert320(perm_counting_out([1,2,3,4], 3) = [4,1,3,2])

(* ****** ****** *)

val () =
assert320(perm_counting_out([0,1,2,3,4,5,6,7,8,9], 13) = [3,8,5,4,7,2,9,1,0,6])

(* ****** ****** *)

(* Added by Zach *)
val () = assert320(perm_counting_out([], 100) = [])
val () = assert320(perm_counting_out([1], 100) = [1])

(* ****** ****** *)
val (  ) = print("perm_counting_out_test: passed!\n")
(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-06-test.sml] *)

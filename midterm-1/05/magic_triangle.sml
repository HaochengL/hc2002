(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-06-06: midterm1-05: 20 points
*)
(* ****** ****** *)
(*
Magic Triangle:
             1
           1   1
         1   2   1
       1   3   3   1
     1   4   6   4   1
   1   5   10  10  5   1
 1   6   15  20  15  6   1

THe magic triangle has the following structure:
- All numbers on the left and right borders are 1.
- All numbers in the interior (non-border) are the sum of the numbers in the row directly above it.

The following example shows how row 6 is computed from row 5.

row 5:      1     4     6     4    1
           / \   / \   / \   / \  / \
row 6:    1   1+4   4+6   6+4  4+1   1


We can represent a magic triangle in SML as an int list list where each row
is stored as a nested int list.

row 0  [[1]
row 1   [1,  1]
row 2   [1,  2,  1]
row 3   [1,  3,  3,  1]
row 4   [1,  4,  6,  4,  1]
row 5   [1,  5,  10, 10, 5,  1]
row 6   [1,  6,  15, 20, 15, 6,  1]]
...


Please implement a function that produces a magic triangle with n row.

triangle 0 = [[1]]
triangle 1 = [[1], [1, 1]]
triangle 2 = [[1], [1, 1], [1, 2, 1]]
triangle 3 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]]
triangle 4 = [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]]
...
triangle n = ??

Hint: You might want a helper function to compute the current row from
the previous.

*)

(*
fun
magic_triangle (n : int) : int list list = ...
*)

(* ****** ****** *)

(*
val () =
assert320
(
magic_triangle(5) =
[[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1],[1,5,10,10,5,1]])
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-magic_triangle.sml] *)

fun magic_triangle(n: int) = 
  let
    fun nextrow(row: int list) = 
      let
        fun addpairs(xs, acc) =
          case xs of
          [] => list_reverse(1::acc)
          | [x] => list_reverse (1::acc)
          | x1::x2::xs => addpairs(x2::xs, (x1+x2)::acc)
      in
        addpairs(row, [1])
      end

    fun createrows(row: int list list, i: int) = 
      if i <= n 
      then 
        let
          val next_row = nextrow(list_head(list_reverse(row)))
        in
          createrows(row@[next_row], i+1)
        end
      else row
  in
    createrows([[1]], 1)
  end

val triangle = magic_triangle 5
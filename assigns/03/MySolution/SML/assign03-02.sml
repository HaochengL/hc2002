(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-06-12: 20 points
*)
(* ****** ****** *)
(*
Note that you are not allowed to define
recursive functions for solving this one.
*)
(* ****** ****** *)
(*
Here are some functions that you can use in
your solution to this one.
*)
val
strsub = String.sub
val
string_length = String.size
val
string_implode = String.implode
val
string_filter = foreach_to_filter_list(string_foreach)


(* ****** ****** *)

(*
A word here is defined to be a (possibly empty)
sequence of lowcase letters in the English alphabet.
Two words w1 and w2 are neighbors if they are of the
same length and differ by exactly one letter.
//
For instance, [water] and [later] are neighbors.
For instance, [abcde] and [abxde] are neighbors.
For instance, [abcde] and [abcde] are not neighbors.
//
Given a word, the function [word_neighbors] returns
a list consisting of *all* the neighbors of the word.
//
fun word_neighbors(word: string): string list = ...
//
Please give an implementation of word_neighbors.
Note that you are NOT allowed to define recursive functions
in your implementation.
//
*)

(* ****** ****** *)

val AB =
"abcdefghijklmnopqrstuvwxyz"

(* ****** ****** *)

val
string_iforeach =
foreach_to_iforeach(string_foreach)
val
string_imap_list =
fn(cs, ifopr) =>
foreach_to_map_list(string_iforeach)(cs, ifopr)

(* ****** ****** *)

(*
val
word_neighbors = fn(word: string) => ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-02.sml] *)

val word_neighbors = fn(word: string) => 
  let
    fun stc(str: string): char list =
      foreach_to_map_list(string_foreach) (str, fn c => c)

    val len = string_length(word)
    val letters = stc(AB);

    fun gen_neighbors (i: int, char: char): string list =
      list_map(letters, fn new_char =>
            if char = new_char then ""
            else String.concat [(String.substring(word, 0, i)),
                                String.str(new_char),
                                (String.substring(word, i+1, len-i-1))])
    val neighbor_list = list_concat(string_imap_list(word, gen_neighbors))
  in
    list_filter (neighbor_list, fn s => s <> "")
  end





   

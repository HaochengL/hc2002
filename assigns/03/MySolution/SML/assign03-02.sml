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

def string_to_char_list(string):
    return list(string)

def word_neighbors(word):
    len_word = len(word)
    letters = string_to_char_list("AB")

    def gen_neighbors(i, char):
        neighbor_list = []
        for new_char in letters:
            if char != new_char:
                new_word = word[:i] + new_char + word[i+1:]
                neighbor_list.append(new_word)
        return neighbor_list

    neighbor_list = []
    for i, char in enumerate(word):
        neighbor_list.extend(gen_neighbors(i, char))
    
    return [s for s in neighbor_list if s != ""]








   

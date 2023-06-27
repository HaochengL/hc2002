(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-19: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign04-01.sml] *)


fun stream_permute_list(xs: 'a list): 'a list stream =
    let
        fun put_at_all_positions elem lst =
            let
                fun helper pref [] = 
                    [list_reverse(pref) @ [elem]]
                  | helper pref (h::t) = 
                    (list_reverse(pref) @ (elem::h::t)) :: helper (h::pref) t
            in
                helper [] lst
            end

        fun strcon_join (lst1: 'a list stream, lst2: 'a list stream) =
            case lst1() of
                strcon_nil => lst2()
              | strcon_cons(h1, lst1') => 
                strcon_cons(h1, fn () => strcon_join(lst1', lst2))
        
        fun stream_merge (lst: ('a list) stream) (f: 'a list -> ('a list) stream) = 
            fn () =>
                case lst() of
                    strcon_nil => strcon_nil
                  | strcon_cons(h, t) => 
                    strcon_join (f h, stream_merge t f)
        
        fun compute_perms lst =
            case lst of
                [] => list_streamize [[]]
              | h::t => 
                stream_merge 
                (compute_perms t) 
                (fn p => list_streamize (put_at_all_positions h p))
    in
        compute_perms xs
    end




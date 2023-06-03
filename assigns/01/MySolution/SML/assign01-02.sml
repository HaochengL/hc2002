(* ****** ****** *)
use "./../../assign01-lib.sml";
(* ****** ****** *)
use "./../../MySolution/SML/assign01-01.sml";
(* ****** ****** *)

(*
//
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)


fun
xlist_sub
(xs: 'a xlist, i0: int): 'a = 
    case xs of 
        xlist_nil => raise XlistSubscript
        | xlist_cons(x1,xs) => if i0=0 then x1  else if i0<0 then raise XlistSubscript else xlist_sub(xs, i0-1) 
        | xlist_snoc(xs,x1) => if i0=0 andalso xlist_size(xs) <> 0 then xlist_sub(xs,0) else if i0=0 andalso xlist_size(xs) = 0 then x1 else if i0 = xlist_size(xs) then x1 else if i0 < xlist_size(xs) then xlist_sub(xs, i0) else raise XlistSubscript
        | xlist_append(x1,x2) => if i0= 0 then xlist_sub(x1,0) else if i0 > xlist_size(x1) + xlist_size(x2)-1 then raise XlistSubscript else if i0 > xlist_size(x1)-1 then xlist_sub(x2,i0-xlist_size(x1)) else xlist_sub(x1,i0)
        | xlist_reverse(xs)=> if i0 <= 0 then xlist_sub(xs,xlist_size(xs)-1) else if i0 > xlist_size(xs) - 1 then raise XlistSubscript else xlist_sub(xs, xlist_size(xs)-i0-1)


val xs = xlist_nil
val xs = xlist_snoc(xs, 1)
val xs = xlist_snoc(xs, 2)
val xs = xlist_snoc(xs, 3)
val xs = xlist_snoc(xs, 4)
val xs = xlist_snoc(xs, 5)
val test222= list_of_xlist(xs)
val test333= xlist_sub(xs, 4)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-02.sml] *)

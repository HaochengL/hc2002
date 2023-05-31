type int2 = int * int
type int3 = int * int * int
type int4 = int * int * int * int
type int5 = int * int * int * int * int

val int2_sort_nr =
fn(xs: int2): int2 =>
let
    val (x1, x2) = xs
in
    if x1 <= x2 then (x1,x2) else (x2,x1)
end

val int3_sort_nr =
fn (xs: int3): int3 =>
let
  val (x1, x2, x3) = xs
  val (a, b) = int2_sort_nr(x1, x2)
  val (c, d) = int2_sort_nr(b, x3)
  val (e, f) = int2_sort_nr(a, c)
in
  (e, f, d)
end 

val int4_sort_nr =
fn(xs: int4): int4 =>
let
    val (x1, x2, x3, x4) = xs

    val (a, b) = int2_sort_nr(x1, x2)
    val (c, d) = int2_sort_nr(x3, x4)
    val (e, f) = int2_sort_nr(a, c)
    val (g, h) = int2_sort_nr(b, d)

in
    if f > g then
        (e, g, f, h)
    else if g > f then
        (e, f, g, h)
    else
        (e, f, g, h)
end

val int5_sort_nr =
fn (xs: int5): int5 =>
let
  val (x1, x2, x3, x4, x5) = xs

  val (a,b,c,d) = int4_sort_nr(x1,x2,x3,x4)
  val (e,f,g,h) = int4_sort_nr(b,c,d,x5)

in
    if a>e then
        (e,a,f,g,h)
    else if e>a then
        (a,e,f,g,h)
    else
        (e,a,f,g,h)

end


val xs1: int5 = (2,3,55,1,5)
val sorted_xs1: int5 = int5_sort_nr(xs1)
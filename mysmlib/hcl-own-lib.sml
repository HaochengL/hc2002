fun
stringrev
(cs: string): string = 

(* ****** ****** *)
let
    fun helper(i0: int): string = 
        if i0 <= 0 then "" else
        String.str(String.sub(cs, i0-1)) ^ helper(i0-1)
in 
    helper(String.size(cs))
end

fun list_range(start: int, finish: int): int list = 
    if start >= finish then []
    else list_fromto(start,finish)


fun find_longest (prev: int, nil) : int list = []
  | find_longest (prev, x1::xs) : int list =
      if x1 >= prev
      then x1 :: find_longest (prev, xs)
      else find_longest (prev, xs)


fun isPrime(n: int): bool =
  if n < 2 then
    false
  else
    let
      val range = list_fromto(2, n - 1)
      val divisible = list_exists(range, fn(x) => n mod x = 0)
    in
      divisible = false
    end


fun list_subsets(xs: 'a list): 'a list list =
    let
        fun subsets([], acc) = acc
        | subsets(x::xs, acc) =
            let
                val subsets = subsets(xs, acc)
                val subsetsprepend = mapacc(subsets, fn (subset, res) => (x :: subset) :: res, [])
            in
                subsets @ subsetsprepend
            end

        and mapacc([], _, acc) = acc
        | mapacc(x::xs, f, acc) =
            let
                val result = f(x, acc)
            in
                mapacc(xs, f, result)
            end
    in
        subsets(xs, [[]])
    end



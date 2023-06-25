########################
# HX-2023-06-20: 10 points
########################
"""
Given two words w1 and w2 of the same length,
please implement a function wordle_hint(w1, w2)
that return a sequence of pairs (i, c) for each
character c in w2 where i indicates the color
of c according to the rule of the wordle game:
0: c does not appear in w1
1: c appears in w1 at the same position as it does in w2
2: c appears in w1 at a different position as it does in w2
Please note that the number of times (1, c) or (2, c) appearing
in the returned sequence must be less than or equal to the number
of times c appearing in w1.
For instance,
w1 = water and w2 = water
wordle_hint(w1, w2) =
(1, w), (1, a), (1, t), (1, e), (1, r)
For instance,
w1 = water and w2 = waste
wordle_hint(w1, w2) =
(1, w), (1, a), (0, s), (2, t), (2, e)
For instance,
w1 = abbcc and w2 = bbccd
wordle_hint(w1, w2) =
(2, b), (1, b), (2, c), (1, c), (0, d)
"""
########################################################################
def wordle_hint(w1, w2):
    hint = []
    w1_char_counts = {}
    for c in w1:
        if c in w1_char_counts:
            w1_char_counts[c] += 1
        else:
            w1_char_counts[c] = 1

    for i, c in enumerate(w2):
        if c in w1:
            if c == w1[i] and w1_char_counts[c] > 0:
                hint.append((1, c))
                w1_char_counts[c] -= 1
            elif c != w1[i] and w1_char_counts[c] > 0:
                hint.append((2, c))
                w1_char_counts[c] -= 1
        else:
            hint.append((0, c))
    return hint

########################################################################

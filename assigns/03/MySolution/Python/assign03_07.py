####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
"""
HX-2023-06-12: 20 points
Solving the doublet puzzle
"""
####################################################
def doublet_stream_from(word, words):
    def is_doublet(w1, w2):
        # Check if w1 and w2 are 1-step doublets
        diff_count = sum([1 for c1, c2 in zip(w1, w2) if c1 != c2])
        return diff_count == 1

    def generate_doublets(curr_word, words):
        for i, next_word in enumerate(words):
            if is_doublet(curr_word, next_word):
                # Generate doublets starting with next_word
                remaining_words = words[:i] + words[i+1:]
                yield from (fnlist_cons(curr_word, doublet) for doublet in generate_doublets(next_word, remaining_words))
        yield fnlist_sing(curr_word)

    # Start with a fnlist containing only the given word
    initial_fnlist = fnlist_sing(word)

    # Generate the doublet sequence and return it as a stream
    return stream_of_generator(lambda: generate_doublets(word, words))

def test_doublet_stream_from():
    # A small list of words
    words = ["cat", "bat", "bet", "bed", "bud", "mud", "mad", "mat"]

    # Generate doublets from 'cat'
    doublet_stream = doublet_stream_from("cat", words)

    # Print the first 5 doublet sequences
    for _ in range(5):
        doublet_sequence = stream_get_at(doublet_stream, _)
        if doublet_sequence is not None:
            print(doublet_sequence)

test_doublet_stream_from()


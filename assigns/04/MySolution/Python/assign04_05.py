########################
# HX-2023-06-20: 30 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess. THIS GUESS SHOULD NOT CONTRADICT
ANY ONE OF THE HINTS GIVEN.
"""

########################################################################

########################
# HX-2023-06-20: 30 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess. THIS GUESS SHOULD NOT CONTRADICT
ANY ONE OF THE HINTS GIVEN. def wordle_guess(hints):
"""
########################################################################
def wordle_guess(hints):
    n = len(hints[0])
    guess = [None] * n
    in_word = set()
    not_in_word = set()

    for hint in hints:
        for i, (score, char) in enumerate(hint):
            if score == 1:
                guess[i] = char
            elif score == 2:
                in_word.add(char)
            else:
                not_in_word.add(char)

    remaining_chars = list(in_word - not_in_word - set(guess))
    for i in range(n):
        if guess[i] is None:
            if remaining_chars:
                guess[i] = remaining_chars.pop()
            else:
                guess[i] = '?'

    return "".join(guess)





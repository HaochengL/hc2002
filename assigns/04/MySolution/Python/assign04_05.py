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
import random

def wordle_guess(hints):
    word_length = len(hints[0])  # Assume all hints have the same length

    # Create a list of sets to store the possible characters for each position
    possible_chars = [set() for _ in range(word_length)]
    possible_chars_2 = [set() for _ in range(word_length)]
    possible_alph = "abcdefghijklmnopqrstuvwxyz"
    possible_alph_2_dump = []

    def addLetter(input, pos, char):
        for i in range(len(input)):
            if i != pos:
                input[i].add(char)
        return input

    def guessWordHelper(i, possible_alph, possible_chars_2, possible_alph_2_dump):
        if len(possible_chars_2[i]) != 0:
            potential = possible_chars_2[i].pop()
            if potential not in possible_alph_2_dump:
                possible_alph_2_dump = possible_alph_2_dump + [potential]
                return potential
            else:
                return guessWord(i, chars, possible_alph, possible_chars_2, possible_alph_2_dump)
        else:
            return random.choice(possible_alph)
            
    def guessWord(i, chars, possible_alph, possible_chars_2, possible_alph_2_dump):
        if len(chars) != 0:
            return chars.pop()
        else:
            return guessWordHelper(i, possible_alph, possible_chars_2, possible_alph_2_dump)

    # Update the possible characters based on the hints
    for hint in hints:
        for i, (color, char) in enumerate(hint):
            if color == 1:
                possible_chars[i].add(char)
            elif color == 0:
                # possible_chars[i].discard(char)
                possible_alph = possible_alph.replace(char, "")
            elif color == 2:
                # possible_chars[i].discard(char)
                possible_chars_2 = addLetter(possible_chars_2, i, char)

    # Construct the guess word using the possible characters
    guess = ""

    for i, chars in enumerate(possible_chars):
        print("possible chars", i, chars, ";", sorted(possible_chars_2[i]))
        value = guessWord(i, chars, possible_alph, possible_chars_2, possible_alph_2_dump)
        #dump = guessWord(i, chars, possible_alph, possible_chars_2, possible_alph_2_dump)[1]
        #possible_alph_2_dump = dump 
        guess += value
    return guess




########################################################################

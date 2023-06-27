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
    
    possibilities = [set() for _ in range(len(hints[0]))]


    placed_chars = set()


    for hint in hints:
        for index, (color, char) in enumerate(hint):
            if color == 1:
                possibilities[index] = {char}
                placed_chars.add(char)


    for hint in hints:
        for index, (color, char) in enumerate(hint):

            if color == 0 or char in placed_chars:
                continue

            possible_positions = set()
            for i, pos in enumerate(possibilities):
                if i != index and not pos:
                    possible_positions.add(i)

            if len(possible_positions) == 1:
                pos_index = possible_positions.pop()
                possibilities[pos_index] = {char}
                placed_chars.add(char)


    remaining_chars = [char for hint in hints for (_, char) in hint if char not in placed_chars and _ == 2]
    for i, pos in enumerate(possibilities):
        if not pos:
            possibilities[i] = {remaining_chars.pop(0)}

    word = "".join([list(pos)[0] for pos in possibilities])

    return word


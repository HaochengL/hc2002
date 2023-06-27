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
    # Keep track of possibilities for each position
    possibilities = [set() for _ in range(len(hints[0]))]

    # Keep track of the characters that have already been placed
    placed_chars = set()

    # First, process all of the (1, c) hints, as these are locked positions
    for hint in hints:
        for index, (color, char) in enumerate(hint):
            if color == 1:
                possibilities[index] = {char}
                placed_chars.add(char)

    # Next, process the (2, c) hints
    for hint in hints:
        for index, (color, char) in enumerate(hint):
            # Ignore 0-color and already placed chars
            if color == 0 or char in placed_chars:
                continue
            # Keep track of potential positions for each character
            possible_positions = set()
            for i, pos in enumerate(possibilities):
                if i != index and not pos:
                    possible_positions.add(i)
            # If there is only one possible position, it's determined
            if len(possible_positions) == 1:
                pos_index = possible_positions.pop()
                possibilities[pos_index] = {char}
                placed_chars.add(char)

    # If there are still undetermined positions, assign the remaining characters
    remaining_chars = [char for hint in hints for (_, char) in hint if char not in placed_chars and _ == 2]

    # Count the frequency of the remaining characters
    char_freq = {}
    for char in remaining_chars:
        if char in char_freq:
            char_freq[char] += 1
        else:
            char_freq[char] = 1

    for i, pos in enumerate(possibilities):
        if not pos:
            # Choose the character with the highest frequency
            max_char = max(char_freq, key=char_freq.get)
            possibilities[i] = {max_char}
            remaining_chars.remove(max_char)
            # Update the frequency count
            if char_freq[max_char] > 1:
                char_freq[max_char] -= 1
            else:
                del char_freq[max_char]

    # Build the final word from possibilities
    word = "".join([list(pos)[0] for pos in possibilities])

    return word



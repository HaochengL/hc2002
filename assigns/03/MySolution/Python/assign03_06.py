####################################################
#!/usr/bin/env python3
####################################################
import sys
sys.path.append('./../../../../mypylib')
from mypylib_cls import *
####################################################
"""
//
HX-2023-06-12: 20 points
Solving the N-queen puzzle
Here is an implementation of the famous 8-queen puzzle:
https://ats-lang.sourceforge.net/DOCUMENT/INT2PROGINATS/HTML/x631.html

//
"""
####################################################
def solve_N_queen_puzzle(N):
    def is_safe(board, row, col):
        # Check if placing a queen at (row, col) is safe
        for i in range(row):
            # Check if there is a queen in the same column or diagonals
            if board[i] == col or \
               board[i] - i == col - row or \
               board[i] + i == col + row:
                return False
        return True

    def place_queens(board, row):
        if row == N:
            # Base case: All queens are placed, yield the board
            yield board
        else:
            for col in range(N):
                if is_safe(board, row, col):
                    # Place a queen at (row, col) and continue recursively
                    new_board = board + (col,)
                    yield from place_queens(new_board, row + 1)

    # Start with an empty board and generate all valid boards
    initial_board = ()
    return place_queens(initial_board, 0)

# Test the solution
theNQueenSols_8 = solve_N_queen_puzzle(8)
for solution in theNQueenSols_8:
    print(solution)



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
def solve_N_queen_puzzle(N):
    def is_safe(board, row, col):
        # Check if a queen placed at (row, col) is safe from attacks
        for i in range(row):
            if board[i] == col or board[i] - col == i - row or board[i] - col == row - i:
                return False
        return True

    def backtrack(board, row):
        nonlocal N, solutions
        if row == N:
            solutions.append(list(board))
        else:
            for col in range(N):
                if is_safe(board, row, col):
                    board[row] = col
                    backtrack(board, row + 1)
                    board[row] = -1

    solutions = []
    initial_board = [-1] * N
    backtrack(initial_board, 0)
    return solutions





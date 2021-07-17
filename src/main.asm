%macro mask 2
    mask_empty_%1: equ %2
    mask_x_%1: equ %2 * 2
    mask_o_%1: equ %2 * 4
%endmacro

section .data
    newline: db 10
    newline_len: equ $-newline

    prompt: db "Move (1-9): "
    prompt_len: equ $-prompt

    rematch_prompt: db "Rematch? (y/n): "
    rematch_prompt_len: equ $-rematch_prompt

    clear_sequence: db 27, "[H", 27, "[2J"
    clear_sequence_len: equ $-clear_sequence

    player_x_turn: db "Player X's Turn", 10
    player_x_turn_len: equ $-player_x_turn

    player_o_turn: db "Player O's Turn", 10
    player_o_turn_len: equ $-player_o_turn

    player_x_winner: db "Player X Wins!", 10
    player_x_winner_len: equ $-player_x_winner

    player_o_winner: db "Player O Wins!", 10
    player_o_winner_len: equ $-player_o_winner

    tie: db "Tie!", 10
    tie_len: equ $-tie

    gameboard_line: db "-------------", 10
    gameboard_line_len: equ $-gameboard_line

    gameboard_row_start: db "| ",
    gameboard_row_start_len: equ $-gameboard_row_start

    gameboard_row_seperator: db " | "
    gameboard_row_seperator_len: equ $-gameboard_row_seperator

    gameboard_row_end: db " |", 10
    gameboard_row_end_len: equ $-gameboard_row_end

    gameboard_x: db "X"
    gameboard_x_len: equ $-gameboard_x

    gameboard_o: db "O"
    gameboard_o_len: equ $-gameboard_o

    gameboard_empty: db " "
    gameboard_empty_len: equ $-gameboard_x

    mask 0, 1
    mask 1, 8
    mask 2, 64
    mask 3, 512
    mask 4, 4096
    mask 5, 32768
    mask 6, 262144
    mask 7, 2097152
    mask 8, 16777216

    mask_turn_x: equ 134217728
    mask_turn_o: equ 1073741824
section .text
    %include "src/include/exit.asm"
    %include "src/include/game.asm"
    %include "src/include/print.asm"
    %include "src/include/clear.asm"
    %include "src/include/input.asm"
    %include "src/include/rematch.asm"
    %include "src/include/gameboard.asm"
    %include "src/include/win_detect.asm"

    global _start

    _start:
        jmp start_game

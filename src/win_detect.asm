%macro check 4
    .check_%1:
        mov rdx, r10
        and rdx, %2
        cmp rdx, %2
        je %3
        jmp %4
%endmacro
%macro spot_empty 2
    .check_tie_%1:
        mov rdx, r10
        and rdx, mask_x_%1
        cmp rdx, mask_x_%1
        je %2

        mov rdx, r10
        and rdx, mask_o_%1
        cmp rdx, mask_o_%1
        je %2

        jmp get_next_move
%endmacro

win_detect:
    jmp .check_top_x_1
.player_x_wins:
    mov rdi, player_x_winner
    mov rsi, player_x_winner_len
    call print
    jmp prompt_rematch
.player_o_wins:
    mov rdi, player_o_winner
    mov rsi, player_o_winner_len
    call print
    jmp prompt_rematch
.check_tie:
    jmp .check_tie_0

spot_empty 0, .check_tie_1
spot_empty 1, .check_tie_2
spot_empty 2, .check_tie_3
spot_empty 3, .check_tie_4
spot_empty 4, .check_tie_5
spot_empty 5, .check_tie_6
spot_empty 6, .check_tie_7
spot_empty 7, .check_tie_8
spot_empty 8, .print_tie

.print_tie:
    mov rdi, tie
    mov rsi, tie_len
    call print
    jmp prompt_rematch

check top_x_1, mask_x_0, .check_top_x_2, .check_middle_horizontal_x_1
check top_x_2, mask_x_1, .check_top_x_3, .check_middle_horizontal_x_1
check top_x_3, mask_x_2, .player_x_wins, .check_middle_horizontal_x_1

check middle_horizontal_x_1, mask_x_3, .check_middle_horizontal_x_2, .check_bottom_x_1
check middle_horizontal_x_2, mask_x_4, .check_middle_horizontal_x_3, .check_bottom_x_1
check middle_horizontal_x_3, mask_x_5, .player_x_wins, .check_bottom_x_1

check bottom_x_1, mask_x_6, .check_bottom_x_2, .check_left_x_1
check bottom_x_2, mask_x_7, .check_bottom_x_3, .check_left_x_1
check bottom_x_3, mask_x_8, .player_x_wins, .check_left_x_1

check left_x_1, mask_x_0, .check_left_x_2, .check_middle_vertical_x_1
check left_x_2, mask_x_3, .check_left_x_3, .check_middle_vertical_x_1
check left_x_3, mask_x_6, .player_x_wins, .check_middle_vertical_x_1

check middle_vertical_x_1, mask_x_1, .check_middle_vertical_x_2, .check_right_x_1
check middle_vertical_x_2, mask_x_4, .check_middle_vertical_x_3, .check_right_x_1
check middle_vertical_x_3, mask_x_7, .player_x_wins, .check_right_x_1

check right_x_1, mask_x_2, .check_right_x_2, .check_first_diagonal_x_1
check right_x_2, mask_x_5, .check_right_x_3, .check_first_diagonal_x_1
check right_x_3, mask_x_8, .player_x_wins, .check_first_diagonal_x_1

check first_diagonal_x_1, mask_x_0, .check_first_diagonal_x_2, .check_second_diagonal_x_1
check first_diagonal_x_2, mask_x_4, .check_first_diagonal_x_3, .check_second_diagonal_x_1
check first_diagonal_x_3, mask_x_8, .player_x_wins, .check_second_diagonal_x_1

check second_diagonal_x_1, mask_x_2, .check_second_diagonal_x_2, .check_top_o_1
check second_diagonal_x_2, mask_x_4, .check_second_diagonal_x_3, .check_top_o_1
check second_diagonal_x_3, mask_x_6, .player_x_wins, .check_top_o_1

check top_o_1, mask_o_0, .check_top_o_2, .check_middle_horizontal_o_1
check top_o_2, mask_o_1, .check_top_o_3, .check_middle_horizontal_o_1
check top_o_3, mask_o_2, .player_o_wins, .check_middle_horizontal_o_1

check middle_horizontal_o_1, mask_o_3, .check_middle_horizontal_o_2, .check_bottom_o_1
check middle_horizontal_o_2, mask_o_4, .check_middle_horizontal_o_3, .check_bottom_o_1
check middle_horizontal_o_3, mask_o_5, .player_o_wins, .check_bottom_o_1

check bottom_o_1, mask_o_6, .check_bottom_o_2, .check_left_o_1
check bottom_o_2, mask_o_7, .check_bottom_o_3, .check_left_o_1
check bottom_o_3, mask_o_8, .player_o_wins, .check_left_o_1

check left_o_1, mask_o_0, .check_left_o_2, .check_middle_vertical_o_1
check left_o_2, mask_o_3, .check_left_o_3, .check_middle_vertical_o_1
check left_o_3, mask_o_6, .player_o_wins, .check_middle_vertical_o_1

check middle_vertical_o_1, mask_o_1, .check_middle_vertical_o_2, .check_right_o_1
check middle_vertical_o_2, mask_o_4, .check_middle_vertical_o_3, .check_right_o_1
check middle_vertical_o_3, mask_o_7, .player_o_wins, .check_right_o_1

check right_o_1, mask_o_2, .check_right_o_2, .check_first_diagonal_o_1
check right_o_2, mask_o_5, .check_right_o_3, .check_first_diagonal_o_1
check right_o_3, mask_o_8, .player_o_wins, .check_first_diagonal_o_1

check first_diagonal_o_1, mask_o_0, .check_first_diagonal_o_2, .check_second_diagonal_o_1
check first_diagonal_o_2, mask_o_4, .check_first_diagonal_o_3, .check_second_diagonal_o_1
check first_diagonal_o_3, mask_o_8, .player_o_wins, .check_second_diagonal_o_1

check second_diagonal_o_1, mask_o_2, .check_second_diagonal_o_2, .check_tie
check second_diagonal_o_2, mask_o_4, .check_second_diagonal_o_3, .check_tie
check second_diagonal_o_3, mask_o_6, .player_o_wins, .check_tie

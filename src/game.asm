%macro move_handler 1
    .handle_%1_move:
        cmp rax, 113
        je exit
        cmp rax, 81
        je exit
        cmp rax, 49
        je .spot_0_%1
        cmp rax, 50
        je .spot_1_%1
        cmp rax, 51
        je .spot_2_%1
        cmp rax, 52
        je .spot_3_%1
        cmp rax, 53
        je .spot_4_%1
        cmp rax, 54
        je .spot_5_%1
        cmp rax, 55
        je .spot_6_%1
        cmp rax, 56
        je .spot_7_%1
        cmp rax, 57
        je .spot_8_%1

        jmp print_gameboard
%endmacro
%macro spot 2
    .spot_%1_%2:
        mov rdx, r10
        and rdx, mask_x_%1

        cmp rdx, mask_x_%1
        je print_gameboard

        mov rdx, r10
        and rdx, mask_o_%1

        cmp rdx, mask_o_%1
        je print_gameboard

        xor r10, mask_%2_%1
        jmp .swap_turn
%endmacro

start_game:
    mov r10, ( \
        mask_empty_0 | \
        mask_empty_1 | \
        mask_empty_2 | \
        mask_empty_3 | \
        mask_empty_4 | \
        mask_empty_5 | \
        mask_empty_6 | \
        mask_empty_7 | \
        mask_empty_8 | \
        mask_turn_x \
    )
    call print_gameboard
    ret
get_next_move:
    mov rdx, r10
    and rdx, mask_turn_x

    cmp rdx, mask_turn_x
    je .print_turn_x

    jmp .print_turn_o
.print_turn_x:
    mov rdi, player_x_turn
    mov rsi, player_x_turn_len
    call print
    jmp .print_prompt
.print_turn_o:
    mov rdi, player_o_turn
    mov rsi, player_o_turn_len
    call print
    jmp .print_prompt
.print_prompt:
    mov rdi, prompt
    mov rsi, prompt_len
    call print

    jmp get_user_input_spot
handle_move:
    mov rdx, r10
    and rdx, mask_turn_x

    cmp rdx, mask_turn_x
    je .handle_x_move

    jmp .handle_o_move

move_handler x
move_handler o

spot 0, x
spot 1, x
spot 2, x
spot 3, x
spot 4, x
spot 5, x
spot 6, x
spot 7, x
spot 8, x

spot 0, o
spot 1, o
spot 2, o
spot 3, o
spot 4, o
spot 5, o
spot 6, o
spot 7, o
spot 8, o

.swap_turn:
    xor r10, mask_turn_x
    xor r10, mask_turn_o

    jmp print_gameboard

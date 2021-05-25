%macro print_char 3
    mov rdx, r10

    mov rdi, gameboard_empty
    mov rsi, gameboard_empty_len

    and rdx, mask_x_%1

    mov r8, .print_%2
    mov r9, %3

    cmp rdx, mask_x_%1
    je .print_x_and_jump

    mov rdx, r10
    and rdx, mask_o_%1
    cmp rdx, mask_o_%1
    je .print_o_and_jump

    jmp .print_empty_and_jump
%endmacro

print_gameboard:
    call clear
    call .print_line

    call .print_row_start
    print_char 0, 1, .print_row_seperator

    .print_line:
        mov rdi, gameboard_line
        mov rsi, gameboard_line_len
        call print
        ret
    .print_row_seperator:
        mov rdi, gameboard_row_seperator
        mov rsi, gameboard_row_seperator_len
        call print
        ret
    .print_row_end:
        mov rdi, gameboard_row_end
        mov rsi, gameboard_row_end_len
        call print
        ret
    .print_row_start:
        mov rdi, gameboard_row_start
        mov rsi, gameboard_row_start_len
        call print
        ret
    .print_x_and_jump:
        mov rdi, gameboard_x
        mov rsi, gameboard_x_len
        call print
        call r9
        jmp r8
        ret
    .print_o_and_jump:
        mov rdi, gameboard_o
        mov rsi, gameboard_o_len
        call print
        call r9
        jmp r8
        ret
    .print_empty_and_jump:
        mov rdi, gameboard_empty
        mov rsi, gameboard_empty_len
        call print
        call r9
        jmp r8
        ret
    .print_1:
        print_char 1, 2, .print_row_seperator
        ret
    .print_2:
        print_char 2, 3, .print_row_end
        ret
    .print_3:
        call .print_line
        call .print_row_start
        print_char 3, 4, .print_row_seperator
        ret
    .print_4:
        print_char 4, 5, .print_row_seperator
        ret
    .print_5:
        print_char 5, 6, .print_row_end
        ret
    .print_6:
        call .print_line
        call .print_row_start
        print_char 6, 7, .print_row_seperator
        ret
    .print_7:
        print_char 7, 8, .print_row_seperator
        ret
    .print_8:
        print_char 8, 9, .print_row_end
        ret
    .print_9:
        call .print_line
        jmp win_detect

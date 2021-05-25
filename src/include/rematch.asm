prompt_rematch:
    mov rdi, rematch_prompt
    mov rsi, rematch_prompt_len
    call print
    jmp get_user_input_rematch
handle_rematch:
    cmp rax, 89
    je start_game
    cmp rax, 121
    je start_game

    cmp rax, 78
    je exit
    cmp rax, 110
    je exit

    jmp print_gameboard

%define ICANON 2
%define ECHO 8

%macro input 2
    %1:
        mov rax, 0
        push rax

        push rbp
        mov rbp, rsp
        sub rsp, 56

        push r11
        push rbx
        push rdx
        push rcx
        push rdi
        push rsi

        mov rsi, rax
        mov rsi, 21505
        lea rdx, [rbp - 56]
        mov rax, 16
        syscall

        lea rbx, [rdx + 12]
        and byte [rbx], ~(ICANON | ECHO)
        inc rsi
        push rsi
        mov rax, 16
        push rax
        syscall

        lea rsi, [rbp + 8]
        push rdx
        mov rdx, 8
        mov rax, 0
        syscall

        pop rdx
        pop rax
        pop rsi
        or byte [rbx], (ICANON | ECHO)
        syscall

        pop rsi
        pop rdi
        pop rcx
        pop rdx
        pop rbx
        pop r11

        leave
        pop rax
        mov r9, rax

        mov rdi, newline
        mov rsi, newline_len
        call print

        mov rax, r9

        jmp %2
%endmacro

input get_user_input_spot, handle_move
input get_user_input_rematch, handle_rematch

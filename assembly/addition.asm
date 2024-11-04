section .data
    num1 db 5
    num2 db 15
    result db 0

section .text
    global _start

_start:
    mov al, [num1]      ; Load first number into AL
    add al, [num2]      ; Add second number to AL
    mov [result], al    ; Store result

    ; Exit the program
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status: 0
    syscall

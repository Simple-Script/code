nasm
section .data
    hello db 'Hello, World!', 0

section .text
    global _start

_start:
    ; write(1, hello, 13)
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, hello      ; pointer to message
    mov rdx, 13         ; message length
    syscall

    ; exit(0)
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status: 0
    syscall

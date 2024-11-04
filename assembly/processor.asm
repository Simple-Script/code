section .data
    output db 'Processor: ', 0

section .bss
    buffer resb 64

section .text
    global _start

_start:
    ; Get the processor name
    mov eax, 0
    cpuid
    mov [buffer], ebx
    mov [buffer + 4], edx
    mov [buffer + 8], ecx

    ; Prepare to print the output
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    lea rsi, [output]   ; pointer to output string
    mov rdx, 12         ; length of output string
    syscall

    ; Print the processor name
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    lea rsi, [buffer]   ; pointer to buffer
    mov rdx, 64         ; length of buffer
    syscall

    ; Exit the program
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status: 0
    syscall

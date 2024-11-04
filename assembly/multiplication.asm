section .data
    num1 db 15            ; First number
    num2 db 5             ; Second number
    result db 0           ; To store the result
    msg db "Result: ", 0  ; Message to print
    len equ $ - msg       ; Length of the message

section .bss

section .text
    global _start

_start:
    ; Load numbers into registers
    movzx rax, byte [num1] ; Load num1 into rax
    movzx rbx, byte [num2] ; Load num2 into rbx
    
    ; Multiply the numbers
    mul rbx                 ; rax = rax * rbx (result is in rax)
    
    ; Store result
    mov [result], al       ; Store the lower byte of the result
    
    ; Prepare to write the message
    mov rdi, 1             ; File descriptor (stdout)
    mov rsi, msg           ; Message to print
    mov rdx, len           ; Length of the message
    syscall                ; Invoke the system call
    
    ; Prepare to write the result
    mov rdi, 1             ; File descriptor (stdout)
    movzx rsi, byte [result] ; Load the result
    add rsi, '0'           ; Convert to ASCII
    mov rdx, 1             ; Length of the result
    syscall                ; Invoke the system call
    
    ; Exit the program
    mov rax, 60            ; syscall: exit
    xor rdi, rdi           ; status: 0
    syscall                ; Invoke the system call

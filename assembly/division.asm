nasm
section .data
    result db 0

section .text
    global _start

_start:
    mov rax, 15        ; Load 15 into rax
    mov rbx, 5         ; Load 5 into rbx
    xor rdx, rdx       ; Clear rdx for division
    div rbx            ; Divide rax by rbx, result in rax, remainder in rdx
    mov [result], al   ; Store the result (quotient) in result

    ; Exit the program
    mov rax, 60        ; syscall: exit
    xor rdi, rdi       ; status: 0
    syscall

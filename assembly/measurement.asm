section .data
    inches db 5
    conversion_factor dq 2.54
    centimeters dq 0.0

section .text
    global _start

_start:
    ; Load inches into xmm0
    movzx rax, byte [inches]
    cvtsi2sd xmm0, rax

    ; Load conversion factor into xmm1
    movsd xmm1, qword [conversion_factor]

    ; Multiply inches by conversion factor
    mulsd xmm0, xmm1

    ; Store result in centimeters
    movsd qword [centimeters], xmm0

    ; Exit program
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status: 0
    syscall

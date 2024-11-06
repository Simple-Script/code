section .data
    prompt db "Enter first number: ", 0
    prompt2 db "Enter second number: ", 0
    prompt3 db "Enter operation (+, -, *, /): ", 0
    result_msg db "Result: ", 0
    num1 db 0
    num2 db 0
    operation db 0
    result db 0

section .bss
    input resb 10

section .text
    global _start

_start:
    ; Read first number
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, 20
    int 0x80

    ; Read input
    call read_input
    sub eax, '0'
    mov [num1], al

    ; Read second number
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 22
    int 0x80

    ; Read input
    call read_input
    sub eax, '0'
    mov [num2], al

    ; Read operation
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt3
    mov edx, 30
    int 0x80

    ; Read input
    call read_input
    mov [operation], al

    ; Perform calculation
    mov al, [num1]
    mov bl, [num2]
    mov cl, [operation]

    cmp cl, '+'
    je add
    cmp cl, '-'
    je sub
    cmp cl, '*'
    je mul
    cmp cl, '/'
    je div

    jmp end

add:
    add al, bl
    jmp store_result

sub:
    sub al, bl
    jmp store_result

mul:
    imul al, bl
    jmp store_result

div:
    xor dx, dx
    div bl
    jmp store_result

store_result:
    mov [result], al

    ; Print result
    mov eax, 4
    mov ebx, 1
    mov ecx, result_msg
    mov edx, 8
    int 0x80

    mov eax, [result]
    add eax, '0'
    mov [input], al

    mov eax, 4
    mov ebx, 1
    mov ecx, input
    mov edx, 1
    int 0x80

end:
    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80

read_input:
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 10
    int 0x80
    mov al, [input]
    ret

section .data
    prompt1 db "Enter the first number: ", 0
    prompt2 db "Enter the second number: ", 0
    result db "Result: %d", 0

section .bss
    num1 resb 4
    num2 resb 4

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, 21
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, num1
    mov edx, 4
    int 0x80
    
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, 22
    int 0x80
    
    mov eax, 3
    mov ebx, 0
    mov ecx, num2
    mov edx, 4
    int 0x80
    
    mov eax, dword [num1]
    add eax, dword [num2]
    
    push eax
    push result
    call printf
    add esp, 8
    
    mov eax, 1
    xor ebx, ebx
    int 0x80

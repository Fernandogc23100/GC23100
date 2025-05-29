section .data               ; GC23100 
    dividendo dd 50
    divisor   dd 3

    msg_cociente db "Cociente: ", 0
    len_cociente equ $ - msg_cociente

    msg_resto db "Resto: ", 0
    len_resto equ $ - msg_resto

    salto db 0xA

section .bss
    buffer resb 11

section .text
    global _start

_start:
    ; División de 32 bits
    mov eax, [dividendo]
    xor edx, edx
    div dword [divisor]     ; cociente → eax, resto → edx

    push edx
    push eax

    ; Imprimir "Cociente: "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_cociente
    mov edx, len_cociente
    int 0x80

    ; Imprimir valor de cociente
    pop eax
    call imprimir_numero

    ; Imprimir "Resto: "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg_resto
    mov edx, len_resto
    int 0x80

    ; Imprimir valor del resto
    pop eax
    call imprimir_numero

    ; Salida limpia
    mov eax, 1
    xor ebx, ebx
    int 0x80

imprimir_numero:
    mov edi, buffer + 10
    mov byte [edi], 0
    mov ebx, 10

.convertir:
    xor edx, edx
    div ebx
    add dl, '0'
    dec edi
    mov [edi], dl
    test eax, eax
    jnz .convertir

    ; Imprimir número convertido
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buffer + 10
    sub edx, edi
    int 0x80

    ; Salto de línea
    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, 1
    int 0x80
    ret

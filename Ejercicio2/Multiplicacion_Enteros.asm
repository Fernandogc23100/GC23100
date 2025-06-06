section .data               ; GC23100 
    num1 db 5               ; Primer numero (8 bits)
    num2 db 3               ; Segundo numero (8 bits)
    msg db "Resultado: "    ; Mensaje
    msg_len equ $ - msg
    salto db 0xA            ; Salto de linea
    buffer times 4 db 0     ; Maximo 3 digitos + nulo

section .text
    global _start

_start:
    ; Multiplicacion con registros de 8 bits
    mov al, [num1]          ; al = num1
    mov bl, [num2]          ; bl = num2
    mul bl                  ; al * bl → resultado en AX

    ; Convertir AL (8 bits) a decimal en ASCII
    movzx eax, al           ; extender AL a EAX (32 bits)
    mov ebx, 10
    mov esi, buffer + 3     ; apunta al final del buffer
    mov byte [esi], 0       ; null terminator

.convertir:
    xor edx, edx
    div ebx                 ; EAX / 10 → cociente en EAX, resto en EDX
    add dl, '0'
    dec esi
    mov [esi], dl
    test eax, eax
    jnz .convertir

    ; Imprimir mensaje "Resultado: "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msg_len
    int 0x80

    ; Imprimir numero convertido
    mov eax, 4
    mov ebx, 1
    mov ecx, esi           ; inicio del numero en buffer
    mov edx, buffer + 4
    sub edx, esi           ; longitud del numero
    int 0x80

    ; Imprimir salto de linea
    mov eax, 4
    mov ebx, 1
    mov ecx, salto
    mov edx, 1
    int 0x80

    ; Salir del programa
    mov eax, 1
    xor ebx, ebx
    int 0x80

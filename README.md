# GT_DEC_S10 - Ejercicios en Ensamblador NASM

Este repositorio contiene los ejercicios prácticos desarrollados para la asignatura Diseño y Estructura de Computadoras, implementados en lenguaje ensamblador usando NASM sobre Linux Mint. Cada ejercicio demuestra una operación distinta utilizando registros del sistema x86.

---

## Ejercicios realizados

### Ejercicio 1: Resta de tres enteros (16 bits)
- Se utilizan registros de 16 bits (AX, BX, CX)
- Se realiza la operación: 50 - 20 - 10
- Se convierte el resultado a ASCII y se imprime por consola

**Salida esperada:**
Resultado: 20

---

### Ejercicio 2: Multiplicación (8 bits)
- Se utilizan registros de 8 bits (AL, BL)
- Se realiza la operación: 5 * 3
- Conversión manual a ASCII para imprimir en consola

**Salida esperada:**
Resultado: 15

---

### Ejercicio 3: División de enteros (32 bits)
- Se utilizan registros de 32 bits (EAX, EDX)
- Se realiza la operación: 50 / 3
- Se imprimen el cociente y el resto por separado

**Salida esperada:**
Cociente: 16
Resto: 2

---

## Cómo compilar y ejecutar

Para cada archivo `.asm`, ejecutar desde terminal:

### Ejercicio1

```bash
nasm -f elf32 Resta_Enteros.asm -o Resta_Enteros.o
ld -m elf_i386 -o Resta_Enteros Resta_Enteros.o
./Resta_Enteros

```

### Ejercicio2

```bash
nasm -f elf32 Multiplicacion_Enteros.asm -o Multiplicacion_Enteros.o
ld -m elf_i386 -o Multiplicacion_Enteros Multiplicacion_Enteros.o
./Multiplicacion_Enteros

```

### Ejercicio3
```bash
nasm -f elf32 Division_Enteros.asm -o Division_Enteros.o
ld -m elf_i386 -o Division_Enteros Division_Enteros.o
./Division_Enteros

```
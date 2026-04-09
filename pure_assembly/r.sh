#!/bin/bash

# Author: 
# Program Name: 
# Purpose: 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file atof.asm"
nasm -f elf64 -o atof.o atof.asm

echo "Assemble the X86 file ftoa.asm"
nasm -f elf64 -o ftoa.o ftoa.asm

echo "Assemble the X86 file multiply.asm"
nasm -f elf64 -o multiply.o multiply.asm

echo "Assemble the X86 file pure_assembly.asm"
nasm -f elf64 -o pure_assembly.o pure_assembly.asm

echo "Link the four 'O' file atof.o ftoa.o multiply.o pure_assembly.o"
ld -o go.out atof.o ftoa.o multiply.o pure_assembly.o -g

echo "Next ""Pure Assembly: Input, Output & Multiply"" will run"
./go.out
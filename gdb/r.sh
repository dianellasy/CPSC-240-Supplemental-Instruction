#!/bin/bash

# Author: 
# Program Name: 
# Purpose: 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file gdb_practice.asm"
nasm -f elf64 -o gdb_practice.o gdb_practice.asm

echo "Compile the C file main.c"
gcc  -m64 -Wall -no-pie -o main.o -std=c2x -c main.c

echo "Link the two object files gdb_practice.o main.o to create an executable file"
gcc -m64 -no-pie -o go.out gdb_practice.o main.o -std=c2x -Wall -z noexecstack -lm

echo "Next ""GDB Practice"" will run"
./go.out
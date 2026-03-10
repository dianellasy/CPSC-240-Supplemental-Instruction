#!/bin/bash

# Name: 
# Email: @csu.fullerton.edu
# Date: 
# Course ID: CPSC 240-
# Statement of Purpose: 
# Purpose: r.sh is a Bash script file which compiles and runs the program

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm 

echo "Assemble the X86 file magnitude.asm"
nasm -f elf64 -l magnitude.lis -o magnitude.o magnitude.asm 

echo "Assemble the X86 file manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "Assemble the X86 file show_array.asm"
nasm -f elf64 -l show_array.lis -o show_array.o show_array.asm 

echo "Compile the C file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Link the five 'O' files input_array.o magnitude.o manager.o show_array.o main.o"
gcc -m64 -o go.out input_array.o magnitude.o manager.o show_array.o main.o -fno-pie -no-pie

echo "Next ""Dianella's Magnitude Program"" will run"
./go.out
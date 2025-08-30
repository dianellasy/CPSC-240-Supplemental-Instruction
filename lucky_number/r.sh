#!/bin/bash

# Author: 
# Program Name: 
# Purpose: 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file lucky_number.asm"
nasm -f elf64 -l lucky_number.lis -o lucky_number.o lucky_number.asm

echo "Assemble the X86 file isfloat.asm"
nasm -f elf64 -l isfloat.lis -o isfloat.o isfloat.asm 

echo "Compile the C file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Link the three 'o' files main.o lucky_number.o isfloat.o"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -lm -o go.out main.o lucky_number.o isfloat.o  

echo "Next ""Lucky Number"" will run"
./go.out
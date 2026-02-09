#!/bin/bash

# Author: 
# Program Name: 
# Purpose: 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file math.asm"
nasm -f elf64 -o math.o math.asm

echo "Compile the C file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Link the two 'o' files main.o math.o"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -lm -o go.out main.o math.o  

echo "Next ""Macro Practice"" will run"
./go.out
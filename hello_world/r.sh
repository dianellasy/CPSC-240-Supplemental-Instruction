#!/bin/bash

# Author: 
# Program Name: 
# Purpose: 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file hello.asm"
nasm -f elf64 -o hello.o hello.asm

echo "Compile the C file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Link the two 'o' files main.o hello.o"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -lm -o go.out main.o hello.o  

echo "Next ""Hello World"" will run"
./go.out
#!/bin/bash

# Author: 
# Program Name: 
# Purpose: 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file hello.asm"
nasm -f elf64 -l hello.lis -o hello.o hello.asm

echo "Compile the C file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Link the two 'O' files main.o hello.o"
gcc -m64 -o go.out hello.o main.o -fno-pie -no-pie

echo "Next """" will run"
./go.out
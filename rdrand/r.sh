#!/bin/bash

# Author: 
# Program Name: 
# Purpose:

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file rdrand.asm"
nasm -f elf64 -l rdrand.lis -o rdrand.o rdrand.asm 

echo "Compile the C file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Link the two 'O' files rdrand.o main.o"
gcc -m64 -o go.out rdrand.o main.o -fno-pie -no-pie

echo "Next ""Rdrand"" will run"
./go.out
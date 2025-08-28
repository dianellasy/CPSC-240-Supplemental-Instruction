#!/bin/bash

# Author: 
# Program Name: 
# Purpose: 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file oven.asm"
nasm -f elf64 -o oven.o oven.asm

echo "Compile the C file pizza.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o pizza.o pizza.c

echo "Link the two 'o' files pizza.o oven.o"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -lm -o go.out pizza.o oven.o  

echo "Next """" will run"
./go.out
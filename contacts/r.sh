#!/bin/bash

# Author: 
# Program Name: 
# Purpose:

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file contacts.asm"
nasm -f elf64 -l contacts.lis -o contacts.o contacts.asm

echo "Compile the C file main.c"
gcc  -m64 -Wall -no-pie -o main.o -std=c2x -c main.c

echo "Link the two 'o' files contacts.o main.o"
gcc -m64 -no-pie -o go.out contacts.o main.o -std=c2x -Wall -z noexecstack -lm

echo "Next ""Contacts List"" will run"
./go.out
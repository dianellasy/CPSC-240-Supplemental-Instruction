#!/bin/bash

# Author: Dianella Sy
# Program Name: Palm Beach Electric Company
# Purpose: r.sh is a Bash script file which compiles and runs the program

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file edison.asm"
nasm -f elf64 -l edison.lis -o edison.o edison.asm 

echo "Compile the C file tesla.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o tesla.o tesla.c

echo "Link the two 'O' files edison.o tesla.o"
gcc -m64 -o go.out edison.o tesla.o -fno-pie -no-pie

echo "Next ""Palm Beach Electric Company"" will run"
./go.out
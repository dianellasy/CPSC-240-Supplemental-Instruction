#!/bin/bash

# Author: 
# Program Name: 
# Purpose:

echo "Compile the C file inline_assembly.c"
gcc -c -m64 -Wall -o inline_assembly.o inline_assembly.c    

echo "Create go.out"
gcc -m64 -Wall -o go.out inline_assembly.o

echo "Run the program Inline Assembly"
./go.out
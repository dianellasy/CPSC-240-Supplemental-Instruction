#!/bin/bash

# Author: 
# Program Name: 
# Purpose:

rm *.o, *.lis, *.out

echo "Compile the C file arrayprocess.c"
gcc -c -m64 -Wall -l arrayprocess.lis -o arrayprocess.o arrayprocess.c -g   

echo "Compile the C file arraymain.c"
gcc -c -m64 -Wall -l arraymain.lis -o arraymain.o arraymain.c -g

echo "Link the 'O' files: arrayprocess.o and arraymain.o"
gcc -m64 -fno-pie -no-pie -o inlinedemo.out arraymain.o arrayprocess.o -g

echo "Run the program Inline X86 Example"
gdb ./inlinedemo.out

echo "The script file has terminated."
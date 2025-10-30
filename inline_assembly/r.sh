#!/bin/bash

# Author: 
# Program Name: 
# Purpose:

rm *.o, *.lis, *.out

echo "Compile the C file arrayprocess.c"
gcc -c -m64 -Wall -o arrayprocess.o arrayprocess.c      

echo "Compile the C file arraymain.c"
gcc -c -m64 -Wall -o arraymain.o arraymain.c 

echo "Link the 'O' files: arrayprocess.o and arraymain.o"
gcc -m64 -fno-pie -no-pie -o inlinedemo.out arraymain.o arrayprocess.o  

echo "Run the program Inline X86 Example"
./inlinedemo.out

echo "The script file has terminated."
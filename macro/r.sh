#!/bin/bash

# Author: 
# Program Name: 
# Purpose:

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file area.asm"
nasm -f elf64 -l area.lis -o area.o area.asm

echo "Compile the C++ file main.cpp"
g++ -c -Wall -m64 -no-pie -o main.o main.cpp  -std=c++2a       #-std=c++20

echo "Link the two object files main.o area.co"
g++ -m64 -no-pie -o go.out area.o main.o -std=c++2a     #-std=c++20

echo "Next "Area of a Triangle" will run"
./go.out
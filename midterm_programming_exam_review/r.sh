#!/bin/bash

# Author: 
# Program Name: 
# Purpose:

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file midterm_programming_exam_review.asm"
nasm -f elf64 -l midterm_programming_exam_review.lis -o midterm_programming_exam_review.o midterm_programming_exam_review.asm

echo "Compile the C++ file main.cpp"
g++ -c -Wall -m64 -no-pie -o main.o main.cpp -std=c++2a       

echo "Link the two object files main.o midterm_programming_exam_review.o"
g++ -m64 -no-pie -o go.out midterm_programming_exam_review.o main.o -std=c++2a     

echo "Next "Midterm Programming Exam Review" will run"
./go.out
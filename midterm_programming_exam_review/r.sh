#!/bin/bash

# Author: 
# Program Name: 
# Purpose: 

echo "Remove old executable files if there are any"
rm *.out

echo "Assemble the X86 file midterm_programming_exam_review.asm"
nasm -f elf64 -o midterm_programming_exam_review.o midterm_programming_exam_review.asm

echo "Compile the C file main.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o main.o main.c

echo "Link the two 'o' files main.o midterm_programming_exam_review.o"
gcc -m64 -Wall -fno-pie -no-pie -z noexecstack -lm -o go.out main.o midterm_programming_exam_review.o  

echo "Next ""Midterm Programming Exam Review"" will run"
./go.out
; Program Name: "". This program demonstrates.  Copyright (C) 2025  Dianella Sy

; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
; version 3 as published by the Free Software Foundation.                                                                    
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.

; Author Information:
; Name:
; CWID:
; Section: CPSC 240-#
; Email: @csu.fullerton.edu

; Program Information:
; Name:
; Languages:
; Start Date:
; Completion Date:

; Program's Purpose:
; The "" will teach.

; Project Information:
; Files: main.c, hello.asm, r.sh
; Developing Computer: 
; Status:

; Translator Information:
; Linux:

extern printf
extern fgets
extern stdin
extern strlen
extern isfloat
extern atof

global loop
maximum_number_of_characters_for_input equ 512


; segment .data is where initalized data is declared

segment .data





; segment .bss is where uninitialized data is declared 

segment .bss





; segment .text is the code 

segment .text

; The header or label 'loop:' defines the initial program entry point
loop:

; Back up the General Purpose Registers (GPRs)
push rbp
mov rbp, rsp
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf


jmp prompt

tryAgain:
; Output the invalid data detected message if the user inputted invalid data


prompt:
; Ask for the number of miles from the user's house to CSUF


; Obtain the number of miles from the user's house to CSUF


; Calculate the number of miles from the user's house to CSUF


; Check if the number of miles from the user's house to CSUF is a float
; Download Professor Holliday's isfloat.asm from his website


; If the number of miles from the user's house to CSUF is not a float, go back to tryAgain and input a floating-point number for miles


; Convert the string of number of miles from the user's house to CSUF to a floating-point number


; Output the total distance traveled



; Return the total distance traveled to the driver 



; Pop the General Purpose Registers (GPRs) so the pointer can be restored to the top of the stack and the values can be restored before this function was called 
; After all the pops are done, the stack will be how it was before the function executed 
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
pop rbp

ret
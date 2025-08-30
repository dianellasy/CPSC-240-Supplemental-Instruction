; Program Name: "". This program demonstrates.  Copyright (C) 2025  Dianella Sy

; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
; version 3 as published by the Free Software Foundation.                                                                    *
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      *
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
; Files: 
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

global lucky_number
maximum_number_of_characters_for_input equ 32


; segment .data is where initalized data is declared

segment .data

prompt_floating_point_number db 10, "Enter a floating-point number: ", 0

prompt_invalid_data_detected_message db "You did not input a floating-point number 😡 Try again.", 10, 0

string_format db "%s", 0





; segment .bss is where uninitialized data is declared 

segment .bss

floating_point_number resb maximum_number_of_characters_for_input





; segment .text is the code 

segment .text

; The header or label 'lucky_number:' defines the initial program entry point
lucky_number:

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


; Output the invalid data detected message if the user inputted invalid data



; Ask for a floating-point number



; Obtain the floating-point number



; Calculate the floating-point number



; Check if the floating-point number the user inputted is a float



; If the floating-point number the user inputted is not a float, go back to tryAgain (the header/label) and input a floating-point number



; Convert the floating-point number the user inputted to a floating-point number



; Return the floating-point number to the driver



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
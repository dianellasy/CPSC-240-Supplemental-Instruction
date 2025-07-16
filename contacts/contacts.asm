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
; Files: 
; Developing Computer: 
; Status:

; Translator Information:
; Linux:
; Linux:


extern fgets
extern stdin
extern printf


global contacts


; segment .data is where initalized data is declared

segment .data

align 16

output_program_instructions db "Enter a sequence of phone numbers separated by white space (format: 714714714).", 10, 0

prompt_sequence_of_phone_numbers db "After the last input, press enter followed by Control+D: ", 10, 0

output_program_will_return_execution_to_the_main_function db 10, "This program will return execution to the main function.", 10, 0 

string_format db "%s", 0  





; segment .bss is where uninitialized data is declared 

segment .bss





; segment .text is the code 

segment .text

; The header or label 'contacts:' defines the initial program entry point
contacts:

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


; Output program instructions
mov  rax, 0
mov  rdi, string_format
mov  rsi, output_program_instructions
call printf


; Ask for a sequence of phone numbers
mov  rax, 0
mov  rdi, string_format
mov  rsi, prompt_sequence_of_phone_numbers
call printf


; Create 800 bytes for the incoming phone number (maximum number of bytes the user can input for the phone number)


; Obtain a phone number from the keyboard 


; Check if the user does Control+D


; Reverse the subtraction from creating 800 bytes for the incoming phone number


; Output that the program will return execution to the main function
mov  rax, 0
mov  rdi, string_format
mov  rsi, output_program_will_return_execution_to_the_main_function
call printf


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
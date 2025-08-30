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

global make_pizza
extern ingredients
extern cos


; segment .data is where initialized data is declared
segment .data

ingredient_one db "Tomato", 0
ingredient_two db "Cheese", 0
ingredient_three db "Pepperoni", 0
price dq 10.0
tax dq 0.1
cosine dq 60.0





; segment .bss is where uninitialized data is declared
segment .bss





; segment .text is the code
segment .text

; The header or label 'make_pizza:' defines the initial program entry point
make_pizza: 

; Save/back up the base pointer
push rbp
mov rbp, rsp

; Save/back up the general purpose registers (GPRs)
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

; Implement ingredients function call here
mov rax, 2
mov rdi, 5
mov rsi, ingredient_one
mov rdx, 7
mov rcx, ingredient_two
mov r8, 3
mov r9, ingredient_three
movsd xmm0, [price]
movsd xmm1, [tax]
call ingredients

mov rax, 1
movsd xmm0, [cosine]
call cos 

movsd xmm1, xmm0
movsd xmm0, xmm1


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

; Restore the base pointer
pop rbp

; Return
ret
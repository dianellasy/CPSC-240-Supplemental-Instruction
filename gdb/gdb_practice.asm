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

extern printf
global gdb_practice


; segment .data is where initalized data is declared
segment .data

array dq 123123, 321321, 567567, 765765, 123123, 123545

output_secret_number db "Your secret number is %d", 10, 0

output_lucky_number db "Your lucky number is %.2lf", 10, 0

pi dq 3.14

integer_format db "%ld", 10, 0    





; segment .bss is where uninitialized data is declared 
segment .bss





; segment .text is the code 
segment .text

; The header or label 'gdb_practice:' defines the initial program entry point
gdb_practice:

; Back up the General Purpose Registers (GPRs)
push    rbp
mov     rbp, rsp
push    rbx
push    rcx
push    rdx
push    rsi
push    rdi
push    r8 
push    r9 
push    r10
push    r11
push    r12
push    r13
push    r14
push    r15
pushf


xor     r15, r15    ; Set r15 as the index counter
mov     r14, 42    ; Set the secret number
movsd   xmm14, qword[pi]    ; Set the lucky number


; Print out the secret number
mov     rax, 0
mov     rdi, output_secret_number
mov     rsi, r14
call    printf


; Print out the lucky number
mov     rax, 1
mov     rdi, output_lucky_number
movsd   xmm0, xmm14
call    printf


loop:
; Implement printing of array here



; Increase the counter. If it is 6, exit the loop. If it is not, loop back
inc     r15
cmp     r15, 6
je      exit
jmp     loop


exit:
; Pop the General Purpose Registers (GPRs) so the pointer can be restored to the top of the stack and the values can be restored before this function was called  
; After all the pops are done, the stack will be how it was before the function executed 
popf          
pop     r15
pop     r14
pop     r13
pop     r12
pop     r11
pop     r10
pop     r9 
pop     r8 
pop     rdi
pop     rsi
pop     rdx
pop     rcx
pop     rbx
pop     rbp

ret
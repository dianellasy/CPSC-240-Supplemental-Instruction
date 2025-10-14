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


; Declaration Section
%include "math.inc" ; Contains macros
extern scanf
extern printf
global midterm_programming_exam_review


; segment .data is where initalized data is declared
segment .data


; New line and float
new_line db 10, 0
double_float db "%lf", 0


; Area of the triangle
prompt_side_one db "Enter the length of the first side of the triangle as a floating point number: ", 0
prompt_side_two db "Enter the length of the second side of the triangle as a floating point number: ", 0
confirm_sides db "Thank you. You entered two sides: %1.5lf and %1.5lf.", 10, 0
area_of_triangle db "The area of the triangle via the macro is %lf", 10, 0


; Third angle of the triangle
one_hundred_eighty dq 180.0, 0
prompt_angle_one db "Enter the first angle as a floating point number: ", 0
prompt_angle_two db "Enter the second angle as a floating point number: ", 0
confirm_angles db "Thank you. You entered two angles: %1.10lf and %1.10lf.", 10, 0
third_angle_message db "The third angle via the macro is %lf", 10, 0


; Flip one bit
integer db "The integer in r12 is %ld", 10, 0





; segment .bss is where uninitialized data is declared 
segment .bss
align 64               ; 64-byte alignment is necessary for xsav and xrstor to operate
mainstorage resb 832





; segment .text is the code 
segment .text

midterm_programming_exam_review:

; Macro backs up the GPRs
create_activation_record

; Macro to backup the 3 state components including xmms
backup_components mainstorage	; Backup all 3 components


; Output a newline
mov  rax, 0
mov  rdi, new_line
call printf


; ---------- GROUP 1 ----------
; Prompt the user to input the length of the first side of the triangle as a floating point number



; Input the length of the first side of the triangle



; Prompt the user to input the length of the second side of the triangle as a floating point numbers



; Input the length of the second side of the triangle



; Output the length of the two sides of the triangle the user inputted



; Call macro to do the computation of area of the triangle
; xmm10 = length of side1
; xmm11 = length of side2
; xmm12 = register that will receive the computed area from the macro



; Output the value in xmm12 as verification that the macro <area_of_a_triangle> really performs correctly



; Output a newline
mov  rax, 0
mov  rdi, new_line
call printf



; ---------- GROUP 2 ----------
; Prompt the user to input the first angle of the triangle


; Input the first angle of the triangle



; Prompt the user to input the second angle of the triangle


; Input the second angle of the triangle



; Output the two angles of the triangle the user inputted



; Move 180.0 to xmm7



; Call macro to find the third angle of the triangle
; xmm7 = 180.0
; xmm9 = first angle
; xmm8 = second angle



; Output the value in xmm7 as verification that the macro <third_angle> really performs correctly




; ---------- GROUP 3 ----------
; Output a newline
mov  rax, 0
mov  rdi, new_line
call printf


; Set 5 equal to r12, which equals 00000000.....0000101



; Print "The integer in r12 is 5"



; In the next lines of code, We are going to make the 1 in the third position from the right perform a flip 1 to 0!


; Set 4 equal to rbx, which equals 00000000.....0000000100 (single 1 in position 3)


; Flip the third bit from the right, so r12 changes to 00000000.....000001   


; Print "The integer in r12 is 1"



; Move the area of the triangle to the rsp (register stack pointer)
movsd [rsp], xmm12


; Restore state component values by activating a macro
restore_components mainstorage      ; Reverses the action of a former macro


; Send the area of the triangle to the driver, main.cpp
movsd xmm0, xmm12


; Restore original values to general registers
delete_activation_record    

ret
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


;Declaration Section


; segment .data is where initalized data is declared
segment .data





; segment .bss is where uninitialized data is declared 
segment .bss





; segment .text is the code 
segment .text

area_of_a_triangle:

; Macro backs up the GPRs
create_activation_record

; Macro to backup the 3 state components including xmms
backup_components mainstorage	; One line of code to backup all 3 components


; Output a newline
push qword 0
mov rax, 0
mov rdi, new_line
call printf
pop rax


; Prompt the user to input the first side of the triangle as a 64-bit float


; Input length of the first side of the triangle


; Prompt the user to input the second side of the triangle


; Input length of the second side of the triangle


; Show the 2 recent numeric inputs to the human viewer


; Call macro to do the computation of area
; xmm10 = length of side1
; xmm11 = length of side2
; xmm12 = register that will receive the computed area from the macro


; Output the value in xmm12 as verification that the macro <area_float> really performs correctly


; Protect the hypotenuse
push qword 0
movsd [rsp], xmm12


; Restore state component values by activating a macro
restore_components mainstorage      ; We call a macro that reverse the action of a former macro


; Use a register to send value of hypotenuse to the caller program
movsd xmm0, [rsp]
pop rax


; Restore original values to general registers
delete_activation_record    ; A call to a macro eliminates a lot of clutter in this function

ret
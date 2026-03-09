; Program Name: "". This program demonstrates.  Copyright (C) 2026  Dianella Sy

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
%include "restore.inc" ; Contains macros
extern scanf
extern printf
global midterm_programming_exam_review


; segment .data is where initalized data is declared
segment .data


; New line, float, and string format
new_line db 10, 0
double_float db "%lf", 0
string db "%s", 0


integer db "The integer in r12 is %ld", 10, 0
happy_birthday_chris_message db "Happy Birthday, Chris 🥳", 0





; segment .bss is where uninitialized data is declared 
segment .bss





; segment .text is the code 
segment .text

midterm_programming_exam_review:

; Macro backs up the GPRs
create_activation_record


; Set 5 equal to r12, which equals 00000000.....0000101


; Print "The integer in r12 is 5"


; In the next lines of code, We are going to make the 1 in the third position from the right perform a flip 1 to 0!


; Set 4 equal to rbx, which equals 00000000.....0000000100 (single 1 in position 3)
 

; Flip the third bit from the right, so r12 changes to 00000000.....000001   


; Print "The integer in r12 is 1"


; Print a new line


; Move 0 to r15 and 44 to r14


; Create a header/label named compare and compare the loop counter with 44


; Create a header/label named print_message, increment the loop counter, and print the happy birthday message + new line


; Jump to compare


; Restore original values to general registers
delete_activation_record    

ret
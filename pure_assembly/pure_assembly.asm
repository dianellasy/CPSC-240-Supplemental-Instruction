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
extern atof
extern ftoa
extern multiply


; segment .data is where initalized data is declared
segment .data

; Define standard constants
line_feed           equ 10 ; line feed
null         equ 0  ; end of string
exit_success equ 0  ; success code
stdin        equ 0  ; standard input
stdout       equ 1  ; standard output
sys_read     equ 0  ; read
sys_write    equ 1  ; write
sys_exit     equ 60 ; terminate


; Define some strings
strlen   equ 50
greeting_message db "Hello World!", line_feed, null
prompt_first_float_number db "Please enter the first float number: ", null   
output_float_number db "You inputted ", null 
prompt_second_float_number db "Please enter the second float number: ", null
output_product db "The product is ", null
closing_message db "Thank you for attending my SI session today! Have a good weekend 💗", null    
new_line  db line_feed, null





; segment .bss is where uninitialized data is declared 
segment .bss    
character       resb 1  
in_line    resb strlen+2    ; total of 52 (null terminator + newline)
in_line_two resb strlen+2    ; total of 52 (null terminator + newline)





; segment .text is the code 
segment .text

; The header or label '_start:' defines the initial program entry point
global _start
_start:

; Print new line
mov  rdi, new_line
call printString


; Display "Hello World!"
mov  rdi, greeting_message
call printString


; Display "Please enter the first float number: "
mov  rdi, prompt_first_float_number  
call printString    


; Read characters from user (one at a time)
mov rbx, in_line ; in_line address
mov r12, 0      ; character count


read_characters_one:
mov rax, sys_read   ; system code for read
mov rdi, stdin      ; standard in
lea rsi, byte [character] ; address of character
mov rdx, 1          ; count (how many to read)
syscall             ; do syscall


mov al, byte [character] ; move the character to al; nasm cannot infer the operand size from context since 1 byte = byte, 2 bytes = word, 4 bytes = dword, and 8 bytes = qword
cmp al, line_feed         ; if linefeed/new line character (10), input done
je  read_done_one


inc r12               ; increment character count
cmp r12, strlen       ; if # of characters ≥ strlen
jae read_characters_one ;   stop placing in buffer (no more room 🥀)


mov byte [rbx], al ; in_line[i] = character
inc rbx            ; update in_line address


jmp read_characters_one


read_done_one:
mov byte [rbx], null ; add null termination (0)


;  Output "You inputted"
mov  rdi, output_float_number
call printString


;  Output the line to verify successful read
mov  rdi, in_line
call printString


; Output new line
mov  rdi, new_line
call printString


; Call atof for prompt_first_float_number
mov   rdi, in_line
call  atof
movsd xmm15, xmm0


; Display "Please enter the second float number: "  
mov  rdi, prompt_second_float_number  
call printString    


; Read characters from user (one at a time)
mov rbx, in_line_two ; in_line_two addr
mov r12, 0         ; character count


read_characters_two:
mov rax, sys_read   ; system code for read
mov rdi, stdin      ; standard in
lea rsi, byte [character] ; address of character
mov rdx, 1          ; count (how many to read)
syscall             ; do syscall


mov al, byte [character] ; move the character to al; nasm cannot infer the operand size from context since 1 byte = byte, 2 bytes = word, 4 bytes = dword, and 8 bytes = qword
cmp al, line_feed         ; if linefeed/new line character (10), input done
je read_done_two


inc r12            ; increment character count
cmp r12, strlen    ; if # of characters ≥ strlen
jae read_characters_two ;   stop placing in buffer (no more room 🥀)


mov byte [rbx], al ; in_line[i] = character
inc rbx ; update in_line address


jmp read_characters_two


read_done_two:
mov byte [rbx], null ; add null termination (0)


;  Output "You inputted"
mov  rdi, output_float_number
call printString


;  Output the line to verify successful read
mov  rdi, in_line_two
call printString


; Print new line
mov  rdi, new_line
call printString


; Call atof for prompt_second_float_number
mov   rdi, in_line_two
call  atof
movsd xmm14, xmm0


; Call multiply
movsd xmm0, xmm15
movsd xmm1, xmm14
call  multiply


; xmm13 is the product of xmm15 and xmm14
movsd xmm13, xmm0

movsd xmm0, xmm13   ; first parameter
call  ftoa
mov r15, rax


; Output "The product is"
mov  rdi, output_product
call printString


; Output the product of the two float numbers
mov  rdi, r15
call printString


; Output new line
mov  rdi, new_line
call printString


; Output "Thank you for attending my SI session today! Have a good weekend 💗"
mov  rdi, closing_message
call printString


; Output new line
mov  rdi, new_line
call printString


; Program done
mov rax, sys_exit
mov rdi, exit_success
syscall





; Generic function to display a string to the screen
; String must be null terminated

; Algorithm:
; Count characters in string (excluding null)
; Use syscall to output characters
; Arguments:
; 1) address, string
; Returns: nothing

global printString
printString:
push rbx


; Count characters in string
mov rbx, rdi    ; the parameter or the string
mov rdx, 0  ; characters counter


string_count_loop:
cmp byte [rbx], null    ; compare byte/character with null
je  string_count_done
inc rdx ; increment characters counter
inc rbx ; go to the next byte/character
jmp string_count_loop


string_count_done:
cmp rdx, 0  ; if there are no characters
je  print_done


; Call OS to output string
mov rax, sys_write ; system code for write()
mov rsi, rdi       ; address of chars to write
mov rdi, stdout    ; standard out
syscall            ; system call


; String printed, return to calling routine
print_done:

pop rbx
ret
;************************************************************************************************************
;Program name: "Ftoa".  The long name of this progrtam is "Flote to Analog".  This program accepts a 64-bit *
;float number in IEEE754 format and converts it decimal-based string-formated representation of that number.*
;the lengths of two sides of that triangle.  The program makes use of several macros stored in a separate   *
;Copyright (C) 2024 by Floyd Holliday                                                                       *
;                                                                                                           *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General *
;Public License version 3 as published by the Free Software Foundation.  This program is distributed in the *
;hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY*
;or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details  A copy of the   *
;GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                         *
;************************************************************************************************************

;This program is classified as a library program.  Any person may use it in his or her program provided that
;the using program is also licensed by GPL3.  All other uses are illegal and the users will be prosecuted 
;according to law.
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1
;Author information
;  Name: Floyd Holliday
;  Contact: holliday@fullerton.edu

;Program information
;  Program name: Test Ftoa
;  Programming languages: X86 (ftoa),  C++ (driver)driver
;  Date program development began Dec 28, 2024
;  Date of most recent update: Jan 20, 2025
;  Files: driver.cpp, ftoa.asm
;  Development computer: Intel Core i7-5820K running Xubuntu 24.04

;Function ftoa information
;  Function name: ftoa, an acronym for Float to Analog.
;  Version number: 1.0
;  Program classification: Library
;  License: GPL3.  The other licesne LGPL3 was intentionally not applied in this case.
;  Programming language: X86
;  Syntax:  Intel
;  Date development started: 2024-Dec-28
;  Date of last update:      2025-Jan-20
;  Assemble instruction: nasm -f elf64 -l ftoa.lis -o ftoa.o ftoa.asm
;  Develop and test platform: Intel Core i7-5820K running Xubuntu 24.04
;  Status: Final release.  The author will provide updates as bug fixes should any bugs occur.
;  Prototype of this function:  char * ftoa(double floatnum);

;Background
;  Floating-point numbers in most modern computers are stored in a format known as IEEE754.  For example, a 
;number like 4.1 appears to humans a two decimal digits.  But the machine does not store a 4 and a 1.  The 
;machine holds a binary representation of the number that is somewhat akin to 4.0999999999.  When a float 
;number 4.1 is passed to the function ftoa, the function is actually receiving 4.099999.  This function 
;ftoa will act on the internal numberic representation given to it.  In the example, the machine has no 
;knowlege of 4.1 but does have 4.099999999.  We will see this reflected in the outputs produced by ftoa.

;Prototype of ftoa:  char * ftoa(double x);
;ftoa may be called from C++, C, or X86.

;Terminology:  Consider the floating point number  385.6291.   The group 385 is called the integral part and 
;the group 6291 is called the fractional part.

;About the string length of the returned C-string.  The programmer or user of ftoa should set the length of
;returned C-string by adjusting the constant string_len declared in the Declaration section below.  A small value
;less than say 5 will not produce meaningful values.  The constant should be re-set to meet the needs of the 
;current user.

;No AI was used in the construction of this library function ftoa.  The source files driver.cpp and ftoa.asm are
;formatted for understandability by beginning students of computer science.
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2

;===== Begin Code ======================================================================================

;Declarations
ascii_zero equ 48
ascii_dot equ  46
integer_ten equ 10
string_len equ 16	;The next programmer should take charge of setting string length
null equ 0
global ftoa
;extern printf           ;printf was used for debugging; now it can be safely removed


segment .data
   numeric_message db "The string at this point is %s",10,0
   mark db "one",0

segment .bss
   number_string resb string_len

segment .text
ftoa:

;Alert: The GPRs and the SSE registers have not been backed up.

;Copy the passed in float number to xmm8
movsd xmm8,xmm0

;Backup of GPRs was omitted


;=========================================================================
;Determine the sign of the incoming number.  r15 is the sign flag.
mov r15,0
xorpd xmm0,xmm0     ;Create a temporary zero in xmm0
ucomisd xmm8,xmm0
ja continue
mov r15,1
continue:    ;Now r15=0 if xmm8 >=0.0 and f15=1 if xmm8 <0.0

;Block to replace xmm8 with its absolute value
xorpd xmm0,xmm0
subsd xmm0,xmm8
maxsd xmm8,xmm0
;============================================================================




;Remove the integral part of xmm8 and save that part as an unsigned integer in rax
roundsd xmm6,xmm8,3
cvtsd2si rax,xmm6

;r12 will count the number of digits in the integral part
xor r12,r12

;Rename number_string as r13
mov r13, number_string

beginleftsideofdot:

cmp r12,string_len-1   ;Check for space available in the string r13
jge append_null
cmp rax,0       ;If rax == 0 then break out of the loop
  je outofloop
  cqo
  mov r10,integer_ten
  div r10        ;integer_ten
  push rdx       ;Push the remainder value
  inc r12
  jmp beginleftsideofdot
outofloop:
  ;rax is now 0; r12 has counted the number of pushes onto the stack

  ;Let r14 be the index into the array r13
  xor r14,r14



;  ;Begin block of inserted code=============================================================
;If the original number is negative then place a negative sign in the first byte of the array r13
  cmp r15,0
  je positive
  mov byte [r13],'-'
  inc r14
  inc r12       ;<== New insert instruction to execute in the negative case only
  ;End block of inserted code==================================================================

positive:

  ;Begin loop that transferrs pushed values to the string r13

leftsideofdot:
  cmp r14,string_len
  jge append_null
  cmp r14,r12
  jge appenddot
  pop rax              ;The number popped is one of the decimal digits: 0..9
  add al,ascii_zero                ;48 equals the ascii value of zero
  mov byte [r13+r14],al
  inc r14
jmp leftsideofdot

appenddot:

;Append one dot
mov byte [r13+r14],ascii_dot
inc r14

;Begin block that converts the fractional part of the original float to the array of chars

;Subtract the whole part from the original number leaving only the fractional part in xmm8.
subsd xmm8,xmm6

;Establish the constant 10.0 (ten decimal float)
mov r10,10
cvtsi2sd xmm10,r10          ;xmm10 is the constant 10.0


begin_fractional_loop:

; Check if there is available space in the destination array.
cmp r14, string_len-1
jge out_of_loop

; --- Process the first digit ---
mulsd xmm8, xmm10           ; Multiply fraction by 10 (e.g., 0.0 -> 0.0, 0.5 -> 5.0)
roundsd xmm9, xmm8, 3       ; Truncate to get the integer part (e.g., 0.0 -> 0.0, 5.0 -> 5.0)
cvtsd2si r9, xmm9           ; Convert to integer (r9 = 0, or r9 = 5)
add r9, ascii_zero          ; Convert to ASCII character ('0' or '5')
mov [r13+r14], r9b          ; Place character in the string
inc r14                     ; Move to next position in string

; Remove the whole number part that we just processed
subsd xmm8, xmm9

; --- Now, check if we should continue ---
; If the remaining fractional part is 0.0, we are done.
xorpd xmm0, xmm0
ucomisd xmm8, xmm0
je out_of_loop

; If not zero, loop back to process the next digit
jmp begin_fractional_loop

out_of_loop:
append_null:   ;Append the null char
mov byte [r13+r14],null

inc r14

;===== Block for debugging =====================================================
;If deemed un-necessary, this block may be removed by a future programmer.
;mov rax,0
;mov rdi, numeric_message
;mov rsi, r13
;call printf

mov rax,r13       ;Send the string back to the driver
ret

;===== End of source code =================================================
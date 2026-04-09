; //****************************************************************************************************************************
; //Program name: "stringtof". This program will be called from _start.asm and will receive a char array. The program will then
; //               take that char array and convert it into a float number. It will then be returned to _start.asm as a float number (xmm)
; //               Copyright (C) 2022 Timothy Vu.
; //                                                                                                                           *
; //This file is part of the software program "stringtof".                                                                   *
; //stringtof is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
; //version 3 as published by the Free Software Foundation.                                                                    *
; //stringtof is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
; //warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *

; //A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *


; //****************************************************************************************************************************
; //=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**//

; //Author information
; //  Author name: Timothy Vu
; //  Author email: timothy.vu@csu.fullerton.edu
; //  Author Section: M/W 2:00pm-3:50pm
; //
; //Program information
; //  Program name: stringtof
; //  Programming languages: seven modules in X86
; //  Date program began: 2022 October 23
; //  Date of last update: 2022 October 26
; //  Date of reorganization of comments: 2022 October 27
; //  Files in this program: _start.asm, _math.asm, cosine.asm, ftoa.asm, itoa.asm, stringtof.asm strlen.asm
; //  Status: Finished.  The program was tested extensively with no errors in Tuffix 2020 Edition.
; //
; //Purpose
; //  The purpose of this file is to receive a char array, convert that array into a float number, and
; //  return the result as a float number (xmm)
; //
; //This file
; //   File name: stringtof.asm
; //   Language: x86
; //   Max page width: 139 columns
; //   Compile: nasm -f elf64 -o stringtof.o -l stringtof.lis stringtof.asm
; //   Linker: ld -o final.out _start.o strlen.o cosine.o itoa.o _math.o ftoa.o stringtof.o 
; //
; //=======1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
; //
; //
; //===== Begin code area ===========================================================================================================

;Assembler directives
base_number equ 10                      ;10 base of the decimal number system
ascii_zero equ 48                       ;48 is the ascii value of '0'
null equ 0
minus equ '-'
decimal_point equ '.'

;Global declaration for linking files.
global atof                          ;This makes atolong callable by functions outside of this file.

segment .data                           ;Place initialized data here
   ;This segment is empy
    ten_float   dq 10.0     ; Floating point constant for 10.0
    minus_one   dq -1.0     ; Floating point constant for -1.0

segment .bss                            ;Declare pointers to un-initialized space in this segment.
   ;This segment is empty

;==============================================================================================================================
;===== Begin the executable code here.
;==============================================================================================================================
segment .text                           ;Place executable instructions in this segment.

atof:                                ;Entry point.  Execution begins here.

;The next two instructions should be performed at the start of every assembly program.
push rbp                                ;This marks the start of a new stack frame belonging to this execution of this function.
mov  rbp, rsp                           ;rbp holds the address of the start of this new stack frame.
;The following pushes are performed for safety of the data that may already be in the remaining GPRs.
;This backup process is especially important when this module is called by another asm module.  It is less important when called
;called from a C or C++ function.
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


 ; rdi = pointer to the input string
    xor     rsi, rsi            ; rsi = index into the string, starts at 0
    xor     r12, r12            ; r12b will be our neg_flag (0 = positive, 1 = negative)
    xorpd   xmm0, xmm0          ; xmm0 will hold the integer part of the number
    xorpd   xmm1, xmm1          ; xmm1 will hold the fractional part of the number

    ; --- 1. Handle Sign ---
    cmp     byte [rdi + rsi], '-'
    jne     check_positive_sign
    mov     r12b, 1             ; Set neg_flag
    inc     rsi                 ; Move to the next character
    jmp     integer_loop_start

check_positive_sign:
    cmp     byte [rdi + rsi], '+'
    jne     integer_loop_start
    inc     rsi                 ; Move to the next character

    ; --- 2. Process Integer Part ---
integer_loop_start:
    ; Check if the current character is a digit
    movzx   rax, byte [rdi + rsi]
    cmp     rax, '0'
    jl      handle_decimal_point ; If less than '0', it's not a digit
    cmp     rax, '9'
    jg      handle_decimal_point ; If greater than '9', it's not a digit

    ; It is a digit, so process it
    ; xmm0 = xmm0 * 10.0
    mulsd   xmm0, [ten_float]

    ; Convert char to integer ('5' -> 5)
    sub     rax, '0'

    ; Convert integer to float and add to our total
    cvtsi2sd xmm2, rax          ; xmm2 = (double)rax
    addsd   xmm0, xmm2          ; xmm0 = xmm0 + new_digit

    inc     rsi
    jmp     integer_loop_start

    ; --- 3. Handle Decimal Point ---
handle_decimal_point:
    cmp     byte [rdi + rsi], '.'
    jne     combine_parts       ; If not a decimal, we are done parsing
    inc     rsi                 ; Move past the '.'

    ; --- 4. Process Fractional Part ---
    ; Setup for the fractional loop
    mov     r13, ten_float      ; Use memory address of 10.0
    movsd   xmm3, [r13]         ; xmm3 = divisor, starting at 10.0

fractional_loop_start:
    ; Check if the current character is a digit
    movzx   rax, byte [rdi + rsi]
    cmp     rax, '0'
    jl      combine_parts       ; Not a digit, finish up
    cmp     rax, '9'
    jg      combine_parts       ; Not a digit, finish up

    ; It's a digit, process it
    sub     rax, '0'            ; Convert char to integer
    cvtsi2sd xmm2, rax          ; Convert integer to float (e.g., 7 -> 7.0)

    divsd   xmm2, xmm3          ; xmm2 = digit / divisor (e.g., 7.0 / 10.0 = 0.7)
    addsd   xmm1, xmm2          ; Add to fractional total

    mulsd   xmm3, [ten_float]   ; Update divisor for next digit (10 -> 100 -> 1000)
    inc     rsi
    jmp     fractional_loop_start

    ; --- 5. Final Combination ---
combine_parts:
    addsd   xmm0, xmm1          ; Final number = integer part + fractional part

    ; Apply the negative sign if the flag was set
    cmp     r12b, 1
    jne     epilogue
    mulsd   xmm0, [minus_one]   ; Make the number negative


epilogue:
;==================================================================================================================================
;Epilogue: restore data to the values held before this function was called.
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
pop rbp                       ;Now the system stack is in the same state it was when this function began execution.
ret                           ;Pop a qword from the stack into rip, and continue executing..
;========== End of module atol.asm ================================================================================================; //****************************************************************************************************************************
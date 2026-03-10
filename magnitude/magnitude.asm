; Name: 
; Email: @csu.fullerton.edu
; Date: 
; Course ID: CPSC 240-
; Statement of Purpose: Calculates the magnitude of the inputted array



global magnitude


segment .data





segment .bss





segment .text

magnitude:

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

; Prototype: long magnitude(long array_of_integers[], long size)



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
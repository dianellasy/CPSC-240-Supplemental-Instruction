; Name: 
; Email: @csu.fullerton.edu
; Date: 
; Course ID: CPSC 240-
; Statement of Purpose: Displays the Array

extern printf 
global show_array 


; segment .data is where initalized data is declared 

segment .data

integer_format db "%ld", 10, 0    





; segment .bss is where uninitialized data is declared 

segment .bss





; segment .text is the code 

segment .text

; The header or label 'show_array' defines the initial program entry point
show_array:

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

; Prototype: long show_array(long size, long array_of_integers[])
mov r12, rdi ; rdi contains the array's size or how many elements are in the array, which is now moved to r12
mov r13, rsi ; rsi is the array, which is now moved to r13
xor r15, r15 ; r15 is a loop counter which equals 0 at the initalization


begin_loop:  
; Compare how many elements are in the array with the loop counter
cmp r15, r12 
jge finish_loop ; Jump to the marker finish_loop if it it looped through all of the elements


; Output 1 integer
mov  rax, 0
mov  rdi, integer_format
mov  rsi, qword [r13 + 8*r15]   ; Move what is pointing to in the array to rsi
call printf 


; Increment the loop counter
inc r15  


; Jump to the marker begin_loop
jmp begin_loop   


finish_loop: 
; Send a 0 to manager.asm for a successful execution
mov rax, 0  


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
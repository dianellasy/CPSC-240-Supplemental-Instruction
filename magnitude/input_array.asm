; Name: 
; Email: @csu.fullerton.edu
; Date: 
; Course ID: CPSC 240-
; Statement of Purpose: Inputs the Array

extern atol
extern fgets
extern stdin
extern strlen
extern printf
extern isinteger
global input_array


; segment .data is where initalized data is declared 

segment .data

align 16

prompt_invalid_data_detected_message db "An error was detected. Re-enter the number.", 10, 0

string_format db "%s", 0

align 64





; segment .bss is where uninitialized data is declared

segment .bss





; segment .text is the code 

segment .text

; The header or label 'input_array:' defines the initial program entry point
input_array:

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


; Back up the array and its maximum size 
mov r14, rdi    ; The array is in rdi, which is now moved to r14
mov r15, rsi    ; The array's size or how many cells are in the array are in rsi, which is now moved to r15
xor rbx, rbx    ; rbx is a loop counter which equals 0 at the initalization


sub rsp, 800    ; Create 800 bytes for the incoming integer (maximum number of bytes the user can input for the integer)


; Jump to the marker begin_loop 
jmp begin_loop


try_again:
; Output invalid data detected message if the user inputted invalid data 
mov  rax, 0
mov  rdi, string_format
mov  rsi, prompt_invalid_data_detected_message
call printf


begin_loop:
; Obtain an integer from the keyboard 
mov  rax, 0
mov  rdi, rsp   
mov  rsi, 799   ; Maximum storage of 800 - 1 = 799 bytes; 1 is reserved for null 
mov  rdx, [stdin]    
call fgets


; Check if the user does Control+D
cmp eax, 0 
je  finish_loop  ; If the user does Control+D, it goes to the finish_loop marker


; Calculate the length of what the user inputted
mov  rax, 0
mov  rdi, rsp 
call strlen
mov  byte [r14 + rax - 1], 0


; If what the user inputted is not an integer, go back to the marker try_again and input a valid integer
cmp rax, -1  
je  try_again   


; Convert the string of an integer the user inputted to an integer 
mov  rax, 0
mov  rdi, rsp    ; atol only accepts rdi so wherever it is placed, in this case rsp, has to be moved to rdi
call atol   


; Copy the new inputted integer into the next open cell of the array
mov [r14 + 8*rbx], rax  ; r14 is the array, 8 is 8 bytes in each cell, and rbx is the loop counter
inc rbx ; Increment the loop counter for the next iteration


; Check if the array is full
cmp rbx, r15    ; Check if rbx == r15 or if r15 reached 100 cells or if the array is full
jge finish_loop ; Jump if its greater than or equal to the marker finish_loop       
jmp begin_loop  ; Else jump to the marker begin_loop


finish_loop:
; Send the loop counter into rax and reverse the subtraction
mov rax, rbx    ; Send the loop counter into rax, so it can return to manager
add rsp, 800    ; Reverse the subtraction of sub rsp, 800 in line 113


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
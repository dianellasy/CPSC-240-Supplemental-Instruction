; Name: 
; Email: @csu.fullerton.edu
; Date: 
; Course ID: CPSC 240-
; Statement of Purpose: Manages Program (calls magnitude, input_array, & show_array)

extern fgets
extern stdin
extern printf
extern strlen

extern magnitude
extern input_array
extern show_array

global manager
maximum_number_of_characters_for_input equ 512


; segment .data is where initalized data is declared

segment .data

align 16

prompt_integer_numbers db 10,"Please enter integer numbers separated by white space. Use Control+D to terminate inputs: ", 10, 0

output_thank_you_message_and_values_in_array db 10, "Thank you for your inputs. These are the values in your array now: ", 10, 0

output_magnitude_of_squares db 10, "The sum of squares is %1ld.", 10, 0

output_magnitude db "The magnitude of the array is %1.8lf units", 10, 0

string_format db "%s", 0

align 64



; segment .bss is where uninitialized data is declared

segment .bss

array_of_integers resq 100   ; array_of_integers has 100 cells





; segment .text is the code

segment .text

; The header or label 'manager:' defines the initial program entry point
manager:

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


; Ask for a sequence of long integers 
mov  rax, 0
mov  rdi, string_format
mov  rsi, prompt_integer_numbers
call printf


; Call input_array 
mov  rax, 0
mov  rdi, array_of_integers ; array_of_integers moves to rdi
mov  rsi, 100   ; The maximum size of the array is 100 cells, which is moved in rsi
call input_array
mov  r15, rax   ; r15 is how many numbers have been entered into array_of_integers


; Output the array 
mov  rax, 0
mov  rdi, output_thank_you_message_and_values_in_array
mov  rsi, r12       ;<==Mystery: Where does r12 receive a value?
call printf


; Call output_array 
mov  rax, 0
mov  rdi, r15   ; r15 contains how many numbers are in array_of_integers  
mov  rsi, array_of_integers       
call show_array

mov  r12, rax     ;<==r12 receives the value returned by function show_array, but r12 is never used again.


; Call magnitude 


; Output the magnitude of squares in the array 


; Convert the integer to a float and then take the square root 


; Output the magnitude of the numbers in the array  


; Return the magnitude to the calling program 


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
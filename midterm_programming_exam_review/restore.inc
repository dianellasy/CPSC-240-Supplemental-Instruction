; This is an include file for the program Midterm Programming Exam Review

; Macro that backs up all the GPRs
%macro create_activation_record 0    
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
%endmacro


; Macro that deletes activation record 
%macro delete_activation_record 0
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
%endmacro
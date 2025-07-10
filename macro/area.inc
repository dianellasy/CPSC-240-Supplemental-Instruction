; This is an include file for the program Area of a Triangle


; Macro computes the area of a right triangle using float numbers

; End of macro receiving float values





; Other macros
%macro backup_components 1
; This macro backs up all registers except GPRs to an array specified in parameter %1
   mov rax,7
   mov rdx,0
   xsave [%1]
%endmacro


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


; Macro restore_components
%macro restore_components 1
   mov rax,7
   mov rdx,0
   xrstor [%1]
%endmacro


; Macro delete activation record 
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
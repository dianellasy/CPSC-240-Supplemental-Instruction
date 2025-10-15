; This is an include file for the program Midterm Programming Exam Review

; Macro computes the area of a right triangle using float numbers
%macro area_of_a_triangle 3
   ; %1 = length of side 1 as qword float
   ; %2 = length of side 2 as qword float
   ; %3 = computed area
  movsd xmm13, %1
  mulsd xmm13, %2       ; xmm13 = product of two sides
  mov   rbx, 2            
  cvtsi2sd xmm14, rbx
  divsd xmm13, xmm14    ; Divide product of two sides by 2 
  movsd %3, xmm13
%endmacro


; Macro computes the third angle of a right trangle
%macro third_angle 3
   ; %1 = 180.0
   ; %2 = first angle of the triangle
   ; %3 = second angle of the triangle
   movsd xmm15, %1
   subsd xmm15, %2
   subsd xmm15, %3
   movsd %1, xmm15
%endmacro


; Macro backs up all registers except GPRs to an array specified in parameter %1
%macro backup_components 1
   mov rax, 7
   mov rdx, 0
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
   mov rax, 7
   mov rdx, 0
   xrstor [%1]
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
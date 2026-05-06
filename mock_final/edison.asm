; Author Name: 
; Author Email: 
; Course and Section: 
; Date: 


extern printf
extern fgets
extern stdin
extern strlen
extern atof

global electricity
maximum_number_of_characters_for_input equ 512


; segment .data is where initialized data is declared

segment .data

align 16

prompt_electric_force_in_circuit db 10, "Please enter the electric force in the circuit (volts): ", 0

prompt_resistance_in_circuit_number_one db "Please enter the resistance in circuit number 1 (ohms): ", 0

prompt_resistance_in_circuit_number_two db "Please enter the resistance in circuit number 2 (ohms): ", 0

output_thank_you db "Thank you.", 10, 0

output_current_on_the_first_circuit db "The current on the first circuit is %1.5lf amps.", 10, 0

output_current_on_the_second_circuit db "The current on the second circuit is %1.5lf amps.", 10, 0

output_total_current db "The total current is %1.5lf amps.", 10, 0

string_format db "%s", 0

align 64





; segment .bss is where uninitialized data is declared

segment .bss

electric_force_in_circuit        resb maximum_number_of_characters_for_input
resistance_in_circuit_number_one resb maximum_number_of_characters_for_input
resistance_in_circuit_number_two resb maximum_number_of_characters_for_input





; segment .text is the code

segment .text

; The header or label 'electricity:' defines the initial program entry point
electricity:

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


; Ask for the electric force in the circuit (volts)
mov  rax, 0
mov  rdi, string_format
mov  rsi, prompt_electric_force_in_circuit
call printf


; Obtain the electric force in the circuit (volts)
mov  rax, 0
mov  rdi, electric_force_in_circuit
mov  rsi, maximum_number_of_characters_for_input
mov  rdx, [stdin]
call fgets


; Calculate the length of the electric force in the circuit (volts)
mov  rax, 0
mov  rdi, electric_force_in_circuit
call strlen 
mov  r13, rax 
mov  [electric_force_in_circuit + r13 - 1], byte 0


; Convert the string of the electric force in the circuit (volts) to a floating-point number
mov   rax, 0
mov   rdi, electric_force_in_circuit
call  atof
movsd xmm15, xmm0


; Ask for the resistance in circuit number 1 (ohms)
mov  rax, 0
mov  rdi, string_format
mov  rsi, prompt_resistance_in_circuit_number_one
call printf


; Obtain the resistance in circuit number 1 (ohms)
mov  rax, 0
mov  rdi, resistance_in_circuit_number_one
mov  rsi, maximum_number_of_characters_for_input
mov  rdx, [stdin]
call fgets


; Calculate the length of the resistance in circuit number 1 (ohms)
mov  rax, 0
mov  rdi, resistance_in_circuit_number_one
call strlen 
mov  r13, rax 
mov [resistance_in_circuit_number_one + r13 - 1], byte 0


; Convert the string of the resistance in circuit number 1 (ohms) to a floating-point number
mov   rax, 0
mov   rdi, resistance_in_circuit_number_one
call  atof
movsd xmm14, xmm0


; Ask for the resistance in circuit number 2 (ohms)
mov  rax, 0
mov  rdi, string_format
mov  rsi, prompt_resistance_in_circuit_number_two
call printf


; Obtain the resistance in circuit number 2 (ohms)
mov  rax, 0
mov  rdi, resistance_in_circuit_number_two
mov  rsi, maximum_number_of_characters_for_input
mov  rdx, [stdin]
call fgets


; Calculate the length of the resistance in circuit number 2 (ohms)
mov  rax, 0
mov  rdi, resistance_in_circuit_number_two
call strlen
mov  r13, rax
mov  [resistance_in_circuit_number_two + r13 - 1], byte 0


; Convert the string of the resistance in circuit number 2 (ohms) to a floating-point number
mov   rax, 0
mov   rdi, resistance_in_circuit_number_two
call  atof
movsd xmm13, xmm0


; Output thank you
mov  rax, 0
mov  rdi, string_format
mov  rsi, output_thank_you
call printf


; Copy the value of the electric force in the circuit in xmm12 and xmm11
movsd xmm12, xmm15
movsd xmm11, xmm15


; Divide the electric force in the circuit by the resistance in circuit number 1
divsd xmm12, xmm14


; OOutput the current on the first circuit
mov    rax, 1
mov    rdi, output_current_on_the_first_circuit
movsd  xmm0, xmm12
call   printf


; Divide the electric force in the circuit by the resistance in circuit number 2
divsd xmm11, xmm13


; Output the current on the second circuit
mov    rax, 1
mov    rdi, output_current_on_the_second_circuit
movsd  xmm0, xmm11
call   printf


; Add the current on the first circuit and the second circuit to get the total current
addsd xmm12, xmm11


; Output the total current
mov    rax, 1
mov    rdi, output_total_current
movsd  xmm0, xmm12
call   printf


; Return the total current to the calling program, tesla.c
movsd xmm0, xmm12


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
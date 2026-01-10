; Author Name: 
; Author Email: 
; Course and Section: 
; Date: 


; segment .data is where initialized data is declared 

segment .data

align 16
align 64





; segment .bss is where uninitialized data is declared

segment .bss





; segment .text is the code 

segment .text

; The header or label 'electricity:' defines the initial program entry point


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


; Obtain the electric force in the circuit (volts)


; Calculate the length of the electric force in the circuit (volts) 


; Convert the string of the electric force in the circuit (volts) to a floating-point number


; Ask for the resistance in circuit number 1 (ohms)


; Obtain the resistance in circuit number 1 (ohms)


; Calculate the length of the resistance in circuit number 1 (ohms)


; Convert the string of the resistance in circuit number 1 (ohms) to a floating-point number


; Ask for the resistance in circuit number 2 (ohms)


; Obtain the resistance in circuit number 2 (ohms)


; Calculate the length of the resistance in circuit number 2 (ohms) 


; Convert the string of the resistance in circuit number 2 (ohms) to a floating-point number 


; Output thank you


; Copy the value of the electric force in the circuit in xmm12 and xmm11


; Divide the electric force in the circuit by the resistance in circuit number 1 


; Output the current on the first circuit


; Divide the electric force in the circuit by the resistance in circuit number 2


; Output the current on the second circuit


; Add the current on the first circuit and the second circuit to get the total current


; Output the total current


; Return the total current to the calling program, tesla.c 


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
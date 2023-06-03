.global _start

_start:
	mov R0, #8
	mov R1, #3
	
	bl division
	mov r3, r2 //quotient
	mov r4, r0 //remainder
	b exit
	
// division parameters: R0 = dividend , R1 = divisor
// results: R2 = quotient, R0 = remainder
division:
	push {r0}
	push {r1}
	push {lr}
	mov r2, #0	//Initialize quotient register R2

division_loop:
	cmp r0, r1	// Compare dividend with divisor
	
	mov r3, pc
	add r3, #16
	mov lr, r3
	bge sub_ge 	// If dividend >= divisor, subtract divisor from dividend
	
	// At this point, the quotient is in r2 and remainder is in r0
	pop {lr}
	bx lr //return 
	
	mov lr, pc
	bge add_ge // Increment by 1 quotient register
	
	cmp r0, #0      // Compare dividend with divisor
	bgt division_loop //; If dividend > 0, continue looping
	
	// At this point, the quotient is in r2 and remainder is zero
	pop {lr}
	bx lr //return 
	
sub_ge:
	sub r0, r0, r1
	bx lr
add_ge:
	add r2, r2, #1
	bx lr
	
exit:
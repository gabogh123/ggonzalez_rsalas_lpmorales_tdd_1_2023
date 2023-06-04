.global _start
.equ white, 255
.equ len, 25

_start:

	ldr r12, =original //register R12 stores pointer to original image data
	mov r0, #0 // init i
	ldr r1, =white
	push {r0}
	mov r11, sp //register R13 stores beginning of image_colors
	bl image_colors
	b exit
	
// for (i = 0; i <= 255; i++)	
image_colors:
	add r0, r0, #1
	
	cmp r0, r1
	bgt return_image_colors
	
	push {r0}
	ble image_colors	
	
	bl division

return_image_colors:
	bx lr
	
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
	add r3, r3, #16
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

.data
original:
	.word 4, 4, 4, 4, 4, 3, 4, 5, 4, 3, 3, 5, 5, 5, 3, 3, 4, 5, 4, 3, 4, 4, 4, 4, 4
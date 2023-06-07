.global _start
.equ white, 7 //255
.equ len, 25 //357604

_start:
	mov sp, #0 //init sp
	
	ldr r12, =original //register R12 stores pointer to original image data
	mov r0, #0 // init i
	ldr r1, =white
	//push {r0}
	sub sp, sp, #4
	str r0, [sp]
	
	mov r11, sp //register R11 stores beginning of image_colors
	bl image_colors
	
	mov r10, sp //register R10 stores beginning of frequency_dist
	sub r10, r10, #4
	bl frequency_dist
	
	mov r9, sp //register R9 stores beginning of cumulative_freq
	sub r9, r9, #4
	bl cumulative_freq
	
	mov r8, sp
	sub r8, r8, #4 //register R8 stores beginning of dist_cum_freq
	bl dist_cum_freq

	b exit
	
// for (i = 0; i <= 255; i++)
//	image_colors[i] = i
image_colors:
	add r0, r0, #1
	
	cmp r0, r1
	bgt return_image_colors
	
	//push {r0}
	sub sp, sp, #4
	str r0, [sp]
	
	ble image_colors	
	

return_image_colors:
	mov pc, lr

//for color in image_colors:
//	fr = image_colors.count(color)
//	frequency_dist[color] = fr
//------------------------------
// r0 = i
// r1 = j
// r2 = counter
frequency_dist:
	mov r0, #0 //init r0 to first color
	sub r0, r0, #1
	ldr r3, =white // stop condition (max color)
	ldr r4, =len //stop condition (max pixel)
	
freq_dist_loop_i:
	add r0, r0, #1 //increase color iterator 
	cmp r0, r3 // check if color iterator is greater than 255
	bgt return_frequency_dist
	
	mov r2, #0 // init counter of frequency
	mov r6, #0 //init counter of pixel
	mov r1, r12 // reset pointer to original
	
freq_dist_loop_j:
	cmp r4, r6 // check if reached last pixel
	beq load_freq
	
	ldr r5, [r1] //get image pixel
	cmp r0, r5 //compare color
	bne next_pixel
	add r2, r2, #1 //inc counter of freq
	
next_pixel:
	add r1, r1, #4 //inc address of pixel
	add r6, r6, #1 //inc counter of pixel
	b freq_dist_loop_j

load_freq:
	//push {r2}
	sub sp, sp, #4
	str r2, [sp]
	b freq_dist_loop_i
	
return_frequency_dist:
	mov pc, lr
	
//cont = 0
//for (i = 0; i <= 255; i++):
//	cont += f[i]
//	cuf[i] = cont
cumulative_freq:
	mov r0, r10 //i
	mov r1, #0 //cont
	
cum_freq_loop:
	cmp r0, r9 //stop condition: reached beginning of cumulative_freq array
	beq return_cum_freq
	
	ldr r2, [r0] //get freq_dist[i]
	add r1, r1, r2 // cont += freq_dist[i]
	
	//push {r2}
	sub sp, sp, #4
	str r1, [sp]	
	
	sub r0, r0, #4 //i++
	b cum_freq_loop
	
return_cum_freq:
	mov pc, lr

dist_cum_freq:
	ldr r0, [sp] //get last item in cumulative frequencies array
	ldr r1, =white
	add r1, r1, #1 //amount of colors (256)
	
	//push {lr}
	sub sp, sp, #4
	str lr, [sp]

	//r0 // r1 = r2
	//r0 % r1 = r0
	bl division

	//pop {lr}
	ldr lr, [sp]
	add sp, sp, #4
	
	mov r3, r0 // remainder
	mov r0, #0 //init i
	mov r1, r2
	add r1, r1, #1 //quotient + 1
	ldr r4, =white

dist_cum_freq_loop:
	cmp r0, r4
	bgt return_dist_cum_freq //i > 255
	
	cmp r0, r3
	bge str_r2 // if i >= remainder: add quotient	
str_r1:
	//push {r1}
	sub sp, sp, #4
	str r1, [sp] //store q+1
	b inc_r0
str_r2:
	//push {r2}	
	sub sp, sp, #4
	str r2, [sp] //store q
inc_r0:
	add r0, r0, #1
	b dist_cum_freq_loop

return_dist_cum_freq:
	mov pc, lr
		
// division parameters: R0 = dividend , R1 = divisor
// results: R2 = quotient, R0 = remainder
division:
	//push {lr}
	sub sp, sp, #4
	str lr, [sp]
	
	mov r2, #0	//Initialize quotient register R2

division_loop:
	cmp r0, r1	// Compare dividend with divisor
	
	mov r3, pc
	add r3, r3, #20
	mov lr, r3
	bge sub_ge 	// If dividend >= divisor, subtract divisor from dividend
	
	// At this point, the quotient is in r2 and remainder is in r0
	//pop {lr}
	ldr lr, [sp]
	add sp, sp, #4
	
	mov pc, lr //return 
	
	mov lr, pc
	bge add_ge // Increment by 1 quotient register
	
	cmp r0, #0      // Compare dividend with divisor
	bgt division_loop //; If dividend > 0, continue looping
	
	// At this point, the quotient is in r2 and remainder is zero
	//pop {lr}
	ldr lr, [sp]
	add sp, sp, #4
	
	mov pc, lr //return 
	
sub_ge:
	sub r0, r0, r1
	mov pc, lr
add_ge:
	add r2, r2, #1
	mov pc, lr
	
exit:

.data
original:
	.word 4, 4, 4, 4, 4, 3, 4, 5, 4, 3, 3, 5, 5, 5, 3, 3, 4, 5, 4, 3, 4, 4, 4, 4, 4

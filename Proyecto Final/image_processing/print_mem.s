.global _start
//.equ white, 7 //255
//.equ len, 25 //357604

_start:
	
	mov sp, #0 //init sp
	
	ldr r12, =original //register R12 stores pointer to original image data
	mov r0, #0 // init i
	ldr r1, =white
	ldr r1, [r1] //r1 = 255

	//push {r0}
	sub sp, sp, #4
	str r0, [sp]
	
	mov r11, sp //register R11 stores beginning of image_colors
	//bl image_colors
	mov lr, pc
	b image_colors

	mov r10, sp //register R10 stores beginning of frequency_dist
	sub r10, r10, #4
	//bl frequency_dist
	mov lr, pc
	b frequency_dist

	mov r9, sp //register R9 stores beginning of cumulative_freq
	sub r9, r9, #4
	//bl cumulative_freq
	mov lr, pc
	b cumulative_freq

	mov r8, sp
	sub r8, r8, #4 //register R8 stores beginning of dist_cum_freq
	//bl dist_cum_freq
	mov lr, pc
	b dist_cum_freq 
	
	mov r7, sp
	sub r7, r7, #4 //register R7 stores beginning of cu_feq
	//bl cu_feq
	mov lr, pc
	b cu_feq
	
	//R11 -> image_colors
	//R10 -> cuf
	//R9 -> cu_feq
	mov r10, r9
	mov r9, r7
	//bl map_colors
	mov lr, pc
	b map_colors

	//bl map_pixels
	mov lr, pc
	b map_pixels

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
	ldr r3, =white 
	ldr r3, [r3] // stop condition (max color)
	ldr r4, =len 
	ldr r4, [r4] //stop condition (max pixel)
	
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
	ldr r1, [r1]
	add r1, r1, #1 //amount of colors (256)
	
	//push {lr}
	sub sp, sp, #4
	str lr, [sp]

	//r0 // r1 = r2
	//r0 % r1 = r0
	//bl division
	mov lr, pc
	b division

	//pop {lr}
	ldr lr, [sp]
	add sp, sp, #4
	
	mov r3, r0 // remainder
	mov r0, #0 //init i
	mov r1, r2
	add r1, r1, #1 //quotient + 1
	ldr r4, =white
	ldr r4, [r4]

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

//cont = 0
//for (i = 0; i <= 255; i++):
//      cont += dist_cum_f[i]
//      cu_feq[i] = cont
cu_feq:
        mov r0, r8 //i
        mov r1, #0 //cont

cu_feq_loop:
        cmp r0, r7 //stop condition: reached beginning of cu_feq array
        beq return_cu_feq

        ldr r2, [r0] //get freq_dist[i]
        add r1, r1, r2 // cont += freq_dist[i]

        //push {r2}
        sub sp, sp, #4
        str r1, [sp]

        sub r0, r0, #4 //i++
        b cu_feq_loop

return_cu_feq:
        mov pc, lr

//for(i = 0; i < len; i++):
//	new_color = get_new_color(i)
//	image_colors[i] = new_color
//---------------------------------
// r0 = image_colors
// r1 = cuf
// r2 = cu_feq
map_colors:
	mov r0, r11
	mov r1, r10
	mov r2, r9
	
	mov r3, #0 // i = 0 (first color)
	mov r12, r0 // address to color 
	ldr r4, =white
	ldr r4, [r4] //r4  = 255
	
	//push {lr}
        sub sp, sp, #4
        str lr, [sp]

map_colors_loop:
	cmp r3, r4
	bgt return_map_colors
	
	//r5 = cuf[i]
	//bl get_cuf_i
	mov lr, pc
	b get_cuf_i
	
	//r6
	//bl nearest_cu_feq
	mov lr, pc
	b nearest_cu_feq

	//r7
	//bl nearest_i
	mov lr, pc
	b nearest_i
	str r7, [r12]

	add r3, r3, #1
	sub r12, r12, #4
	b map_colors_loop

return_map_colors:
        //pop {lr}
        ldr lr, [sp]
        add sp, sp, #4
	mov pc, lr

get_cuf_i:
	mov r5, r1 //cuf[0]
	mov r6, #0 //cont

get_cuf_i_loop:
	cmp r6, r3
	beq return_cuf_i
	
	add r6, r6, #1
	sub r5, r5, #4
	b get_cuf_i_loop

return_cuf_i:	
	ldr r5, [r5]
	mov pc, lr		

nearest_cu_feq:
	mov r6, r2 //*cu_feq
	mov r7, r2
	sub r7, r7, #4 //*cu_feq + 1
nearest_cu_feq_loop:
	ldr r8, [r6] //cu_feq[i] 
	ldr r9, [r7] //cu_feq[i+1]

	cmp r5, r9
	bgt next_cu_feq 
	beq return_n_cu_feq_top
	blt get_nearest

next_cu_feq:
	sub r6, r6, #4
	sub r7, r7, #4
	b nearest_cu_feq_loop

get_nearest:
	sub r10, r5, r8
	sub r11, r9, r5
	cmp r10, r11
	blt return_n_cu_feq_bttm
	bge return_n_cu_feq_top

return_n_cu_feq_top:
	mov r6, r7
	mov pc, lr
return_n_cu_feq_bttm:
	mov pc, lr

//r6 = nearest cu_feq address
nearest_i:
	mov r7, #0 // iterator
	mov r8, r2 //cu_feq adress
nearest_i_loop:
	cmp r8, r6
	beq return_nearest_i
	
	add r7, r7, #1
	sub r8, r8, #4
	b nearest_i_loop

return_nearest_i:
	mov pc, lr	

map_pixels:
	ldr r0, =original //pointer to original pixels array address
	mov r1, r12 // pointer to adress in stack for new image storage
	ldr r2, =len
	ldr r2, [r2] //len = 357604
	mov r3, #0 //iterator
map_pixels_loop:
	cmp r3, r2
	beq return_map_pixels
	
	ldr r4, [r0] //original pixel
	b get_pixel	
assign_pixel:
	str r5, [r1]

	add r0, r0, #4
	sub r1, r1, #4
	add r3, r3, #1
	b map_pixels_loop
	
return_map_pixels:
	mov pc, lr

get_pixel:
	mov r6, #0 //iterator
	mov r5, #0 //address of image_colors
	sub r5, r5, #4

get_pixel_loop:
	cmp r6, r4
	beq return_pixel

	add r6, r6, #1
	sub r5, r5, #4
	b get_pixel_loop

return_pixel:
	ldr r5, [r5]
	b assign_pixel
	

exit:

.data
white:
	.word 7 //255
len:
	.word 25 //357604
original:
        .word 4, 4, 4, 4, 4, 3, 4, 5, 4, 3, 3, 5, 5, 5, 3, 3, 4, 5, 4, 3, 4, 4, 4, 4, 4
module start_text (	
		input logic [9:0] x, y,
		output logic pixel
	);

	//text: "PRESS ANY BUTTON TO START"
	logic [20:0] text_pixels, pixels_out;
	assign text_pixels[20] = (x >= 10'd0 & x < 10'd8 & y >= 10'd16 & y < 10'd24 ); //P
	assign text_pixels[19] = (x >= 10'd8 & x < 10'd16 & y >= 10'd16 & y < 10'd24 ); //R
	assign text_pixels[18] = (x >= 10'd16 & x < 10'd24 & y >= 10'd16 & y < 10'd24 ); //E
	assign text_pixels[17] = (x >= 10'd24 & x < 10'd32 & y >= 10'd16 & y < 10'd24 ); //S
	assign text_pixels[16] = (x >= 10'd32 & x < 10'd40 & y >= 10'd16 & y < 10'd24 ); //S

	assign text_pixels[15] = (x >= 10'd48 & x < 10'd56 & y >= 10'd16 & y < 10'd24 ); //A
	assign text_pixels[14] = (x >= 10'd56 & x < 10'd64 & y >= 10'd16 & y < 10'd24 ); //N
	assign text_pixels[13] = (x >= 10'd64 & x < 10'd72 & y >= 10'd16 & y < 10'd24 ); //Y

	assign text_pixels[12] = (x >= 10'd80 & x < 10'd88 & y >= 10'd16 & y < 10'd24 ); //B
	assign text_pixels[11] = (x >= 10'd88 & x < 10'd96 & y >= 10'd16 & y < 10'd24 ); //U
	assign text_pixels[10] = (x >= 10'd96 & x < 10'd104 & y >= 10'd16 & y < 10'd24 ); //T
	assign text_pixels[9] = (x >= 10'd104 & x < 10'd112 & y >= 10'd16 & y < 10'd24 ); //T
	assign text_pixels[8] = (x >= 10'd112 & x < 10'd120 & y >= 10'd16 & y < 10'd24 ); //O
	assign text_pixels[7] = (x >= 10'd120 & x < 10'd128 & y >= 10'd16 & y < 10'd24 ); //N

	assign text_pixels[6] = (x >= 10'd136 & x < 10'd144 & y >= 10'd16 & y < 10'd24 ); //T
	assign text_pixels[5] = (x >= 10'd144 & x < 10'd152 & y >= 10'd16 & y < 10'd24 ); //0
	
	assign text_pixels[4] = (x >= 10'd160 & x < 10'd168 & y >= 10'd16 & y < 10'd24 ); //s
	assign text_pixels[3] = (x >= 10'd168 & x < 10'd176 & y >= 10'd16 & y < 10'd24 ); //T
	assign text_pixels[2] = (x >= 10'd176 & x < 10'd184 & y >= 10'd16 & y < 10'd24 ); //A
	assign text_pixels[1] = (x >= 10'd184 & x < 10'd192 & y >= 10'd16 & y < 10'd24 ); //R
	assign text_pixels[0] = (x >= 10'd192 & x < 10'd200 & y >= 10'd16 & y < 10'd24 ); //T
	
	display_char char_P(8'd80, x, y, text_pixels[20], pixels_out[20]);
	display_char char_R_0(8'd82, x, y, text_pixels[19], pixels_out[19]);
	display_char char_E_0(8'd69, x, y, text_pixels[18], pixels_out[18]);
	display_char char_S_0(8'd83, x, y, text_pixels[17], pixels_out[17]);
	display_char char_S_1(8'd83, x, y, text_pixels[16], pixels_out[16]);
	display_char char_A_0(8'd65, x, y, text_pixels[15], pixels_out[15]);
	display_char char_N_0(8'd78, x, y, text_pixels[14], pixels_out[14]);
	display_char char_Y(8'd89, x, y, text_pixels[13], pixels_out[13]);
	display_char char_B(8'd66, x, y, text_pixels[12], pixels_out[12]);
	display_char char_U(8'd85, x, y, text_pixels[11], pixels_out[11]);
	display_char char_T_0(8'd84, x, y, text_pixels[10], pixels_out[10]);
	display_char char_T_1(8'd84, x, y, text_pixels[9], pixels_out[9]);
	display_char char_O_0(8'd79, x, y, text_pixels[8], pixels_out[8]);
	display_char char_N_1(8'd78, x, y, text_pixels[7], pixels_out[7]);
	display_char char_T_2(8'd84, x, y, text_pixels[6], pixels_out[6]);
	display_char char_O_1(8'd79, x, y, text_pixels[5], pixels_out[5]);
	display_char char_S_2(8'd83, x, y, text_pixels[4], pixels_out[4]);
	display_char char_T_3(8'd84, x, y, text_pixels[3], pixels_out[3]);
	display_char char_A_1(8'd65, x, y, text_pixels[2], pixels_out[2]);
	display_char char_R_1(8'd82, x, y, text_pixels[1], pixels_out[1]);
	display_char char_T_4(8'd84, x, y, text_pixels[0], pixels_out[0]);

	or_n_inputs #(21) or_pixel(pixels_out, pixel);

endmodule

module victory_text (	
		input logic [9:0] x, y,
		output logic pixel
	);
	
	//text: "CONGRATULATIONS! YOU WON!"
	logic [22:0] text_pixels, pixels_out;
	assign text_pixels[22] = (x >= 10'd0 & x < 10'd8 & y >= 10'd16 & y < 10'd24 ); //C
	assign text_pixels[21] = (x >= 10'd8 & x < 10'd16 & y >= 10'd16 & y < 10'd24 ); //O
	assign text_pixels[20] = (x >= 10'd16 & x < 10'd24 & y >= 10'd16 & y < 10'd24 ); //N
	assign text_pixels[19] = (x >= 10'd24 & x < 10'd32 & y >= 10'd16 & y < 10'd24 ); //G
	assign text_pixels[18] = (x >= 10'd32 & x < 10'd40 & y >= 10'd16 & y < 10'd24 ); //R
	assign text_pixels[17] = (x >= 10'd40 & x < 10'd48 & y >= 10'd16 & y < 10'd24 ); //A
	assign text_pixels[16] = (x >= 10'd48 & x < 10'd56 & y >= 10'd16 & y < 10'd24 ); //T
	assign text_pixels[15] = (x >= 10'd56 & x < 10'd64 & y >= 10'd16 & y < 10'd24 ); //U
	assign text_pixels[14] = (x >= 10'd64 & x < 10'd72 & y >= 10'd16 & y < 10'd24 ); //L
	assign text_pixels[13] = (x >= 10'd72 & x < 10'd80 & y >= 10'd16 & y < 10'd24 ); //A
	assign text_pixels[12] = (x >= 10'd80 & x < 10'd88 & y >= 10'd16 & y < 10'd24 ); //T
	assign text_pixels[11] = (x >= 10'd88 & x < 10'd96 & y >= 10'd16 & y < 10'd24 ); //I
	assign text_pixels[10] = (x >= 10'd96 & x < 10'd104 & y >= 10'd16 & y < 10'd24 ); //O
	assign text_pixels[9] = (x >= 10'd104 & x < 10'd112 & y >= 10'd16 & y < 10'd24 ); //N
	assign text_pixels[8] = (x >= 10'd112 & x < 10'd120 & y >= 10'd16 & y < 10'd24 ); //S
	assign text_pixels[7] = (x >= 10'd120 & x < 10'd128 & y >= 10'd16 & y < 10'd24 ); //!

	assign text_pixels[6] = (x >= 10'd136 & x < 10'd144 & y >= 10'd16 & y < 10'd24 ); //Y
	assign text_pixels[5] = (x >= 10'd144 & x < 10'd152 & y >= 10'd16 & y < 10'd24 ); //O
	assign text_pixels[4] = (x >= 10'd152 & x < 10'd160 & y >= 10'd16 & y < 10'd24 ); //U

	assign text_pixels[3] = (x >= 10'd168 & x < 10'd176 & y >= 10'd16 & y < 10'd24 ); //W
	assign text_pixels[2] = (x >= 10'd176 & x < 10'd184 & y >= 10'd16 & y < 10'd24 ); //O
	assign text_pixels[1] = (x >= 10'd184 & x < 10'd192 & y >= 10'd16 & y < 10'd24 ); //N
	assign text_pixels[0] = (x >= 10'd192 & x < 10'd200 & y >= 10'd16 & y < 10'd24 ); //!

	display_char char_C(8'd67, x, y, text_pixels[22], pixels_out[22]); //C
	display_char char_O_0(8'd79, x, y, text_pixels[21], pixels_out[21]); //O
	display_char char_N_0(8'd78, x, y, text_pixels[20], pixels_out[20]); //N
	display_char char_G(8'd71, x, y, text_pixels[19], pixels_out[19]); //G
	display_char char_R(8'd82, x, y, text_pixels[18], pixels_out[18]); //R
	display_char char_A_0(8'd65, x, y, text_pixels[17], pixels_out[17]); //A
	display_char char_T_0(8'd84, x, y, text_pixels[16], pixels_out[16]); //T
	display_char char_U_0(8'd85, x, y, text_pixels[15], pixels_out[15]); //U
	display_char char_L(8'd76, x, y, text_pixels[14], pixels_out[14]); //L
	display_char char_A_1(8'd65, x, y, text_pixels[13], pixels_out[13]); //A
	display_char char_T_1(8'd84, x, y, text_pixels[12], pixels_out[12]); //T
	display_char char_I(8'd73, x, y, text_pixels[11], pixels_out[11]); //I
	display_char char_O_1(8'd79, x, y, text_pixels[10], pixels_out[10]); //O
	display_char char_N_1(8'd78, x, y, text_pixels[9], pixels_out[9]); //N
	display_char char_S(8'd83, x, y, text_pixels[8], pixels_out[8]); //S
	display_char char_excl_0(8'd91, x, y, text_pixels[7], pixels_out[7]); //!
	display_char char_Y(8'd89, x, y, text_pixels[6], pixels_out[6]); //Y
	display_char char_O_2(8'd79, x, y, text_pixels[5], pixels_out[5]); //O
	display_char char_U_1(8'd85, x, y, text_pixels[4], pixels_out[4]); //U
	display_char char_W(8'd87, x, y, text_pixels[3], pixels_out[3]); //W
	display_char char_O_3(8'd79, x, y, text_pixels[2], pixels_out[2]); //O
	display_char char_N_2(8'd78, x, y, text_pixels[1], pixels_out[1]); //N
	display_char char_excl_1(8'd91, x, y, text_pixels[0], pixels_out[0]); //!

	or_n_inputs #(23) or_pixel(pixels_out, pixel);


endmodule

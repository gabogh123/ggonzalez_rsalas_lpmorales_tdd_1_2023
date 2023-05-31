module settings_text (	
		input logic [9:0] x, y,
		output logic pixel
	);

	//text: "SET GOAL WITH SWITCHES"
	logic [18:0] text_pixels, pixels_out;
	assign text_pixels[18] = (x >= 10'd0 & x < 10'd8 & y >= 10'd16 & y < 10'd24 ); //S
	assign text_pixels[17] = (x >= 10'd8 & x < 10'd16 & y >= 10'd16 & y < 10'd24 ); //E
	assign text_pixels[16] = (x >= 10'd16 & x < 10'd24 & y >= 10'd16 & y < 10'd24 ); //T

	assign text_pixels[15] = (x >= 10'd32 & x < 10'd40 & y >= 10'd16 & y < 10'd24 ); //G
	assign text_pixels[14] = (x >= 10'd40 & x < 10'd48 & y >= 10'd16 & y < 10'd24 ); //O
	assign text_pixels[13] = (x >= 10'd48 & x < 10'd56 & y >= 10'd16 & y < 10'd24 ); //A
	assign text_pixels[12] = (x >= 10'd56 & x < 10'd64 & y >= 10'd16 & y < 10'd24 ); //L
	
	assign text_pixels[11] = (x >= 10'd72 & x < 10'd80 & y >= 10'd16 & y < 10'd24 ); //W
	assign text_pixels[10] = (x >= 10'd80 & x < 10'd88 & y >= 10'd16 & y < 10'd24 ); //I
	assign text_pixels[9] = (x >= 10'd88 & x < 10'd96 & y >= 10'd16 & y < 10'd24 ); //T
	assign text_pixels[8] = (x >= 10'd96 & x < 10'd104 & y >= 10'd16 & y < 10'd24 ); //H

	assign text_pixels[7] = (x >= 10'd112 & x < 10'd120 & y >= 10'd16 & y < 10'd24 ); //S
	assign text_pixels[6] = (x >= 10'd120 & x < 10'd128 & y >= 10'd16 & y < 10'd24 ); //W
	assign text_pixels[5] = (x >= 10'd128 & x < 10'd136 & y >= 10'd16 & y < 10'd24 ); //I
	assign text_pixels[4] = (x >= 10'd136 & x < 10'd144 & y >= 10'd16 & y < 10'd24 ); //T
	assign text_pixels[3] = (x >= 10'd144 & x < 10'd152 & y >= 10'd16 & y < 10'd24 ); //C
	assign text_pixels[2] = (x >= 10'd152 & x < 10'd160 & y >= 10'd16 & y < 10'd24 ); //H
	assign text_pixels[1] = (x >= 10'd160 & x < 10'd168 & y >= 10'd16 & y < 10'd24 ); //E
	assign text_pixels[0] = (x >= 10'd168 & x < 10'd176 & y >= 10'd16 & y < 10'd24 ); //S
	
	display_char char_S_0(8'd83, x, y, text_pixels[18], pixels_out[18]);
	display_char char_E_0(8'd69, x, y, text_pixels[17], pixels_out[17]);
	display_char char_T_0(8'd84, x, y, text_pixels[16], pixels_out[16]);
	display_char char_G(8'd71, x, y, text_pixels[15], pixels_out[15]);
	display_char char_O_0(8'd79, x, y, text_pixels[14], pixels_out[14]);
	display_char char_A_0(8'd65, x, y, text_pixels[13], pixels_out[13]);
	display_char char_L(8'd76, x, y, text_pixels[12], pixels_out[12]);
	display_char char_W_0(8'd87, x, y, text_pixels[11], pixels_out[11]);
	display_char char_I_0(8'd73, x, y, text_pixels[10], pixels_out[10]);
	display_char char_T_1(8'd84, x, y, text_pixels[9], pixels_out[9]);
	display_char char_H_0(8'd72, x, y, text_pixels[8], pixels_out[8]);
	display_char char_S_1(8'd83, x, y, text_pixels[7], pixels_out[7]);
	display_char char_W_1(8'd87, x, y, text_pixels[6], pixels_out[6]);
	display_char char_I_1(8'd73, x, y, text_pixels[5], pixels_out[5]);
	display_char char_T_2(8'd84, x, y, text_pixels[4], pixels_out[4]);
	display_char char_C(8'd67, x, y, text_pixels[3], pixels_out[3]);
	display_char char_H_1(8'd72, x, y, text_pixels[2], pixels_out[2]);
	display_char char_E_1(8'd69, x, y, text_pixels[1], pixels_out[1]);
	display_char char_S_2(8'd83, x, y, text_pixels[0], pixels_out[0]);

	or_n_inputs #(19) or_pixel(pixels_out, pixel);

endmodule

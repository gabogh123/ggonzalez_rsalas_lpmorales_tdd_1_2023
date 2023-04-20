module defeat_text (	
		input logic [9:0] x, y,
		output logic pixel
	);
	//text: "YOU LOST"
	logic [6:0] text_pixels, pixels_out;
	assign text_pixels[6] = (x >= 10'd0 & x < 10'd8 & y >= 10'd16 & y < 10'd24 ); //Y
	assign text_pixels[5] = (x >= 10'd8 & x < 10'd16 & y >= 10'd16 & y < 10'd24 ); //O
	assign text_pixels[4] = (x >= 10'd16 & x < 10'd24 & y >= 10'd16 & y < 10'd24 ); //U
	
	assign text_pixels[3] = (x >= 10'd32 & x < 10'd40 & y >= 10'd16 & y < 10'd24 ); //L
	assign text_pixels[2] = (x >= 10'd40 & x < 10'd48 & y >= 10'd16 & y < 10'd24 ); //0
	assign text_pixels[1] = (x >= 10'd48 & x < 10'd56 & y >= 10'd16 & y < 10'd24 ); //S
	assign text_pixels[0] = (x >= 10'd56 & x < 10'd64 & y >= 10'd16 & y < 10'd24 ); //T

	display_char char_Y(8'd89, x, y, text_pixels[6], pixels_out[6]);
	display_char char_O_0(8'd79, x, y, text_pixels[5], pixels_out[5]);
	display_char char_U(8'd85, x, y, text_pixels[4], pixels_out[4]);
	display_char char_L(8'd76, x, y, text_pixels[3], pixels_out[3]);
	display_char char_O_1(8'd79, x, y, text_pixels[2], pixels_out[2]);
	display_char char_S(8'd83, x, y, text_pixels[1], pixels_out[1]);
	display_char char_T(8'd84, x, y, text_pixels[0], pixels_out[0]);

	or_n_inputs #(7) or_pixel(pixels_out, pixel);
	
endmodule

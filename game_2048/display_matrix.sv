module display_matrix(
		input logic [9:0] x,y,
		input logic [11:0] matrix [4][4],
		output logic pixel
	);
	
	logic [15:0] active_pixels, pixels_out;

	assign active_pixels[15] = (x >= 10'd25 & x < 10'd124 & y >= 10'd25 & y < 10'd124 ); // (0,0)
	assign active_pixels[14] = (x >= 10'd135 & x < 10'd234 & y >= 10'd25 & y < 10'd124 ); // (0,1)
	assign active_pixels[13] = (x >= 10'd245 & x < 10'd344 & y >= 10'd25 & y < 10'd124 ); // (0,2)
	assign active_pixels[12] = (x >= 10'd355 & x < 10'd454 & y >= 10'd25 & y < 10'd124 ); // (0,3)

	assign active_pixels[11] = (x >= 10'd25 & x < 10'd124 & y >= 10'd135 & y < 10'd234 ); // (1,0)
	assign active_pixels[10] = (x >= 10'd135 & x < 10'd234 & y >= 10'd135 & y < 10'd234 ); // (1,1)
	assign active_pixels[9] = (x >= 10'd245 & x < 10'd344 & y >= 10'd135 & y < 10'd234 ); // (1,2)
	assign active_pixels[8] = (x >= 10'd355 & x < 10'd454 & y >= 10'd135 & y < 10'd234 ); // (1,3)
	
	assign active_pixels[7] = (x >= 10'd25 & x < 10'd124 & y >= 10'd245 & y < 10'd344 ); // (2,0)
	assign active_pixels[6] = (x >= 10'd135 & x < 10'd234 & y >= 10'd245 & y < 10'd344 ); // (2,1)
	assign active_pixels[5] = (x >= 10'd245 & x < 10'd344 & y >= 10'd245 & y < 10'd344 ); // (2,2)
	assign active_pixels[4] = (x >= 10'd355 & x < 10'd454 & y >= 10'd245 & y < 10'd344 ); // (2,3)
	
	assign active_pixels[3] = (x >= 10'd25 & x < 10'd124 & y >= 10'd355 & y < 10'd454 ); // (3,0)
	assign active_pixels[2] = (x >= 10'd135 & x < 10'd234 & y >= 10'd355 & y < 10'd454 ); // (3,1)
	assign active_pixels[1] = (x >= 10'd245 & x < 10'd344 & y >= 10'd355 & y < 10'd454 ); // (3,2)
	assign active_pixels[0] = (x >= 10'd355 & x < 10'd454 & y >= 10'd355 & y < 10'd454 ); // (3,3)

	display_number display_0_0(matrix[0][0], x, y, 10'd25, 10'd25, active_pixels[15], pixels_out[15]);
	display_number display_0_1(matrix[0][1], x, y, 10'd135, 10'd25, active_pixels[14], pixels_out[14]);
	display_number display_0_2(matrix[0][2], x, y, 10'd245, 10'd25, active_pixels[13], pixels_out[13]);
	display_number display_0_3(matrix[0][3], x, y, 10'd355, 10'd25, active_pixels[12], pixels_out[12]);

	display_number display_1_0(matrix[1][0], x, y, 10'd25, 10'd135, active_pixels[11], pixels_out[11]);
	display_number display_1_1(matrix[1][1], x, y, 10'd135, 10'd135, active_pixels[10], pixels_out[10]);
	display_number display_1_2(matrix[1][2], x, y, 10'd245, 10'd135, active_pixels[9], pixels_out[9]);
	display_number display_1_3(matrix[1][3], x, y, 10'd355, 10'd135, active_pixels[8], pixels_out[8]);

	display_number display_2_0(matrix[2][0], x, y, 10'd25, 10'd245, active_pixels[7], pixels_out[7]);
	display_number display_2_1(matrix[2][1], x, y, 10'd135, 10'd245, active_pixels[6], pixels_out[6]);
	display_number display_2_2(matrix[2][2], x, y, 10'd245, 10'd245, active_pixels[5], pixels_out[5]);
	display_number display_2_3(matrix[2][3], x, y, 10'd355, 10'd245, active_pixels[4], pixels_out[4]);
	
	display_number display_3_0(matrix[3][0], x, y, 10'd25, 10'd355, active_pixels[3], pixels_out[3]);
	display_number display_3_1(matrix[3][1], x, y, 10'd135, 10'd355, active_pixels[2], pixels_out[2]);
	display_number display_3_2(matrix[3][2], x, y, 10'd245, 10'd355, active_pixels[1], pixels_out[1]);
	display_number display_3_3(matrix[3][3], x, y, 10'd355, 10'd355, active_pixels[0], pixels_out[0]);

	or_n_inputs #(16) or_pixel(pixels_out, pixel);

endmodule

module new_tile_gen(
		input logic enable, buttons,
		input logic [3:0] rand_pos,
		input logic [11:0] matrix_Q [3:0][3:0],
		output logic [11:0] matrix_D [3:0][3:0]
	);

	logic [3:0] zeros, new_pos;

	count_zeros zeros_cnt (matrix_Q, zeros);
	assign new_pos = rand_pos % zeros; 

	new_tile new_tile (enable, buttons, matrix_Q, new_pos, matrix_D);


endmodule

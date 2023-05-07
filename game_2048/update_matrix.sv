module update_matrix (
		input logic clk, rst,
		input logic [2:0] Q,
		input logic buttons,
		input logic [11:0] matrix_Q [3:0][3:0],
		output logic [11:0] matrix_D [3:0][3:0]		
	);

	logic [3:0] rand_pos, seed;
    logic en_new_tile; //enable new tile generation

	// generate random position for new tile
	counter_4_bits counter(clk, rst, seed); //dynamic seed
	lfsr random_position(buttons, Q, seed, rand_pos);

    // new tile where next state is 001 or 010
	assign en_new_tile = (~Q[2] & ~Q[1] & ~Q[0]) | (~Q[2] & ~Q[1] & Q[0]) | (~Q[2] & Q[1] & Q[0]);
	new_tile_gen new_tile(en_new_tile, buttons, rand_pos, matrix_Q, matrix_D_0);
	
	// game_logic game_logic(enable, clk, rst, matrix_Q, matrix_D_1, w, l);

	// assign sel = ~Q[2] & Q[1] & Q[0]; //011 
	// mux(sel, matrix_D_0, matrix_D_1, matrix_D)

endmodule

module update_matrix (
		input logic clk,
		input logic [2:0] Q,
		input logic buttons,
		input logic [11:0] matrix_Q [3:0][3:0],
		output logic [11:0] matrix_D [3:0][3:0]		
	);

	logic [3:0] rand_pos, seed;
    logic en_new_tile; //enable new tile generation
	logic [11:0] zero_mat [3:0][3:0] = '{'{12'd0, 12'd0, 12'd0, 12'd0}, 
										'{12'd0, 12'd0, 12'd0, 12'd0},
										'{12'd0, 12'd0, 12'd0, 12'd0},
										'{12'd2, 12'd0, 12'd0, 12'd0}};

	logic [11:0] matrix_D_0 [3:0][3:0];

	assign rst = ~Q[2] & ~Q[1] & ~Q[0];

	// generate random position for new tile
	counter_4_bits counter (clk, rst, seed); //dynamic seed
	lfsr random_position (buttons, Q, seed, rand_pos);


    // new tile where next state is 001 or 010
	assign en_new_tile = (~Q[2] & ~Q[1] & ~Q[0]) | (~Q[2] & Q[1] & Q[0]);
	new_tile_gen new_tile(en_new_tile, buttons, rand_pos, matrix_Q, matrix_D_0);
	

	assign en_game_logic = ~Q[2] & Q[1] & Q[0];
	game_logic g_logic (.clk(clk),
						.rst(rst),
						.enable(en_game_logic),
						.goal(goal),
						.direction(direction),
						.matrix(matrix_Q),
						.matrix_D(matrix_D_game_logic),
						.wl(wl)); /* Aqui saldrian won, lost */


	// assign sel = ~Q[2] & Q[1] & Q[0]; //011 
	// mux(sel, matrix_D_0, matrix_D_1, matrix_D)
	assign matrix_D = rst ? zero_mat : matrix_D_0;

endmodule

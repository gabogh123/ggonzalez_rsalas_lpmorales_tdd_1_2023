module update_matrix_2 (
		input  logic        clk,
		input  logic [2:0]  Q,
		input  logic [3:0]  goal,
		input  logic [3:0]  direction,
		input  logic        buttons,
		input  logic [11:0] matrix_Q [3:0][3:0],
		output logic [11:0] matrix_D [3:0][3:0],
		output logic [1:0]  wl
		);
	

	logic [3:0] rand_pos, seed;
    logic en_new_tile; //enable new tile generation

	logic [11:0] zero_mat [3:0][3:0] = '{'{12'd0, 12'd0, 12'd0, 12'd0}, 
										 '{12'd0, 12'd0, 12'd0, 12'd0},
										 '{12'd0, 12'd0, 12'd0, 12'd0},
										 '{12'd2, 12'd0, 12'd0, 12'd0}};

	logic [11:0] matrix_D_0 [3:0][3:0]; // new_tile matrix
	logic [11:0] matrix_D_1 [3:0][3:0]; // game_logic matrix
	logic [11:0] matrix_mux [3:0][3:0]; // game_logic matrix

	assign rst = ~Q[2] & ~Q[1] & ~Q[0];

	// generate random position for new tile
	counter_4_bits counter (clk, rst, seed); //dynamic seed
	lfsr random_position (buttons, Q, seed, rand_pos);

	logic [1:0] checked_wl;
	logic [1:0] shift_sum_wl;

    // new tile where next state is 001 or 010
	assign en_new_tile_check = !Q[1] | !Q[0];
	new_tile_check n_t_c (.clk(clk),
						  .enable(en_new_tile_check),
						  .button_press(buttons),
						  .position(rand_pos),
						  .goal(goal),
						  .matrix_Q(matrix_Q),
						  .matrix_D(matrix_D_0),
						  .wl(checked_wl));
	/* Aqui esta el modulo de new_tile y check */

	logic game_logic_flag;
	
	// game logic where movements & summations is 011
	assign en_game_logic = ~Q[2] & Q[1] & Q[0];
	//  game_logic_2 (clk, rst, enable,  direction, matrix, matrix_D, ready);
	game_logic_2 g_logic (.clk(clk),
						  .rst(rst),
						  .enable(en_game_logic),
						  .direction(direction),
						  .matrix(matrix_Q),
						  .matrix_DF(matrix_D_1),
						  .ready(game_logic_flag));

	assign shift_sum_wl = 2'b11;

	assign sel = Q[1] & Q[0];

	mux_2MtoM m2MtoM (clk, matrix_D_0, matrix_D_1, sel, matrix_mux);
	assign matrix_D = rst ? zero_mat : matrix_mux;

	mux_2NtoN m2NtoN (clk, checked_wl, shift_sum_wl, sel, wl);

endmodule

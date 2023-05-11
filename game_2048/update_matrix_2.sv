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


	

	//logic [1:0]  checked_wl;
	//logic [1:0]  playing_wl;

	logic ready;

	logic [11:0] start_matrix [3:0][3:0]; // game_logic matrix
	logic [11:0] game_matrix  [3:0][3:0]; // game_logic matrix


	//assign rst = ~Q[2] & ~Q[1] & ~Q[0];

	logic [3:0]  rand_pos;
	lfsr random_position (buttons, Q, 4'b1010, rand_pos);
	
	
	// game logic where movements & summations is 011
	
	new_tile_gen new_tile_g (.Q(Q),
                            .rand_pos(rand_pos),
						    .matrix_Q(matrix_Q),
						    .matrix_D(start_matrix));

	//  game_logic_3
	game_logic_3 g_logic (/*.clk(clk),
						  .rst(rst),*/
						  .enable(en_check),  // enable de check
						  .rand_pos(rand_pos),
						  .direction(direction),
						  .matrix(matrix_Q),
						  .matrix_D(game_matrix),
						  .ready(ready));

	// game logic where movements & summations is 011
	assign en_check = ~Q[2] & Q[1] & ~Q[0];

	/* check */
	check cck (//.clk(clk),
			   .enable(en_check),
			   .goal(goal),
			   .matrix(game_matrix),
			   .W(wl[1]),
			   .L(wl[0]));


	//assign matrix_D = rst ? zero_mat : game_matrix;

	//assign playing_wl = 2'b11;
	//assign sel = Q[1] & Q[0];

	mux_2MtoM m2MtoM (start_matrix, game_matrix, en_check, matrix_D);

endmodule

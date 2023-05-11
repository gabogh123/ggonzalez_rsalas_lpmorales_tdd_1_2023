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

	logic [1:0]  checked_wl;
	logic [1:0]  playing_wl;

	logic [11:0] zero_mat [3:0][3:0] = '{'{12'd0, 12'd0, 12'd0, 12'd0}, 
										 '{12'd0, 12'd0, 12'd0, 12'd0},
										 '{12'd0, 12'd0, 12'd0, 12'd0},
										 '{12'd2, 12'd0, 12'd0, 12'd0}};

	logic [11:0] game_matrix [3:0][3:0]; // game_logic matrix

	assign rst = ~Q[2] & ~Q[1] & ~Q[0];

	// generate random position for new tile
	counter_4_bits counter (clk, rst, seed); //dynamic seed
	lfsr random_position (buttons, Q, seed, rand_pos);

	// game logic where movements & summations is 011
	assign en_check = ~Q[2] & Q[1] & ~Q[0];

	/* check */
	check cck (//.clk(clk),
			   .enable(en_check),
			   .goal(goal),
			   .matrix(matrix_Q),
			   .W(checked_wl[1]),
			   .L(checked_wl[0]));
	
	// game logic where movements & summations is 011
	assign en_game_logic = ~Q[2] & Q[1] & Q[0];

	//  game_logic_3
	game_logic_3 g_logic (/*.clk(clk),
						  .rst(rst),*/
						  .enable(en_game_logic),
						  .rand_pos(rand_pos),
						  .direction(direction),
						  .matrix(matrix_Q),
						  .matrix_D(game_matrix),
						  .ready(ready));


	assign matrix_D = rst ? zero_mat : game_matrix;

	assign playing_wl = 2'b11;
	assign sel = Q[1] & Q[0];

	mux_2NtoN m2NtoN (checked_wl, playing_wl, sel, wl);

endmodule

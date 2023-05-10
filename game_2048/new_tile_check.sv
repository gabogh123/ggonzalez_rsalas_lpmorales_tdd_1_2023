module new_tile_check (clk, enable, button_press, position, goal, 
					   matrix_Q, matrix_D, wl);

	input  logic 		clk;
	input  logic 		enable;
	input  logic  		button_press;
	input  logic [3:0]  position;
	input  logic [3:0]  goal;
	input  logic [11:0] matrix_Q [3:0][3:0];
	output logic [11:0] matrix_D [3:0][3:0];
	output logic [1:0]  wl;

	logic [1:0] D;
	logic [1:0] Q;
	
	/* Current State */
	/*
	current_state_ current_state (.clk(clk),
									   .rst(rst),
									   .enable(enable),
									   .initial_matrix(matrix),
									   .D(D),
									   .matrix_D(matrix_D),
									   .Q(Q),
									   .matrix_Q(matrix_Q));
	*/

	/* Next State */
	/*
	next_state_ 	   next_state (.clk(clk),
									   .enable(enable),
									   .Q(Q),
									   .D(D));
	*/							   
	
	
	
	new_tile_gen new_tile (.enable(enable),
						   .buttons(button_press),
						   .rand_pos(position),
						   .matrix_Q(matrix_Q),
						   .matrix_D(matrix_D));

	// Check
	check cck (.clk(clk),
			   .goal(goal),
			   .matrix(matrix_Q),
			   .W(wl[1]),
			   .L(wl[0]));

	// Fix
	//assign sel = Q[1] & Q[0];

	//mux_2MtoM m2MtoM (clk, matrix_D_0, matrix_D_1, sel, matrix_D);
				
endmodule

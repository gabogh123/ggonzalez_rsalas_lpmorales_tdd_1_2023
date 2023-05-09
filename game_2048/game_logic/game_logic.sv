/*
FSM for game's logic
*/
module game_logic (clk, rst, enable, goal, direction, matrix, matrix_D, wl);

	input  logic 		clk, rst, enable;
	input  logic [3:0]  goal;
	input  logic [3:0]  direction;
	input  logic [11:0] matrix   [3:0][3:0];
	output logic [11:0] matrix_D [3:0][3:0];
	output logic [1:0]  wl;

	logic [1:0] D;
	logic [1:0] Q;
	
	logic [11:0] matrix_Q [3:0][3:0];
		
	logic M;
	logic S;
	
	logic [11:0] moved_matrix   [3:0][3:0];
	logic [11:0] summed_matrix  [3:0][3:0];
	logic [11:0] checked_matrix [3:0][3:0];
	logic [11:0] empty_matrix   [3:0][3:0];

	logic W;
	logic L;

	logic mux_sel;

	
	/* Current State */
	current_state_logic current_state (.clk(clk),
									   .rst(rst),
									   .enable(enable),
									   .initial_matrix(matrix),
									   .D(D),
									   .matrix_D(matrix_D), //borrar
									   .Q(Q),
									   .matrix_Q(matrix_Q)); // borrar
	
	/* Next State */
	next_state_logic 	   next_state (.clk(clk),
									   .enable(enable),
									   .Q(Q),
									   .M(M),
									   .S(S),
									   .D(D));


	// Movement
	/*
	movement_fsm  move (.clk(clk),
						.rst(rst),
						.enable(enable),
						.direction(direction),
						.matrix(matrix_Q),
						.matrix_D(moved_matrix),
						.r(M));*/
	movement move (.clk(clk),
				   .enable(enable),
				   .direction(direction),
				   .matrix(matrix_Q), 
				   .moved_matrix(moved_matrix), 
				   .ready(M));
	
	// Summation
	summation_fsm  sum (.clk(clk),
						.rst(rst),
						.enable(enable),
						.outer_state(Q),
						.direction(direction),
						.matrix(matrix_Q),
						.matrix_D(summed_matrix),
						.r(S));
	
	// Check
	check          cck (.clk(clk),
						.goal(goal),
						.matrix(matrix_Q),
						.checked_matrix(checked_matrix),
						.W(W),
						.L(L));
	

	/* Outputs */
	
	// matrix
	
	mux_4MtoM m4MtoM (clk,
					  moved_matrix,
					  summed_matrix,
					  checked_matrix,
					  empty_matrix,
					  Q,
					  matrix_D);
							
	// WL state
	mux_2NtoN m2NtoN (.clk(clk),
					  .I0(2'b11),
					  .I1({W, L}),
					  .S(mux_sel),
					  .O(wl));


	// Output mux select
	outputs_summation outputs (.Q(Q),
							   .ms(mux_sel));
	

endmodule

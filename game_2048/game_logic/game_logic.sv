/*
FSM for game's logic
*/
module game_logic(clk, rst, goal, direction, matrix_Q, matrix_D, W, L);
	/* enable (?) */

	input  logic 		  clk, rst;
	input  logic [3:0]  goal;
	input  logic [3:0]  direction;
	input  logic [11:0] matrix_Q [3:0][3:0];
	output logic [11:0] matrix_D [3:0][3:0];
	output logic 		  W;
	output logic 		  L;
	
	
	logic [1:0] D;
	logic [1:0] Q;
	
	logic M;
	logic S;
	
	logic [11:0] moved_matrix   [3:0][3:0];
	logic [11:0] summed_matrix  [3:0][3:0];
	logic [11:0] checked_matrix [3:0][3:0];
	
	
	current_state_logic current_state (.clk(clk),
												  .rst(rst),
												  .D(D),
												  .matrix_D(matrix_D),
												  .Q(Q),
												  .matrix_Q(matrix_Q));
												  
	next_state_logic 	  next_state 	 (.Q(Q),
												  .M(M), 
												  .S(S),
												  .D(D));
												  
	// Fix											  
	movement_fsm  move  (clk, rst, direction, matrix_Q, moved_matrix, M);
	
	// Summation ready, testbench to go
	summation_fsm sum   (clk, rst, direction, matrix_Q, summed_matrix, S);
	
	// Make
	//check_fsm     check (clk, rst, goal, matrix_Q, checked_matrix, W, L);
	
	mux_4MtoM m4MtoM (moved_matrix,
							summed_matrix,
							checked_matrix,
							0,
							D,
							matrix_D);
	

endmodule

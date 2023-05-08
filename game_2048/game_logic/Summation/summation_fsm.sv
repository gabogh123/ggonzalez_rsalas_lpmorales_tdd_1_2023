/*
Summation FSM
*/
module summation_fsm (clk, rst, enable, direction, matrix, matrix_D, r);

	input  logic 		clk, rst, enable;
	input  logic [3:0]  direction;
	input  logic [11:0] matrix   [3:0][3:0];
	output logic [11:0] matrix_D [3:0][3:0];
	output logic 		r;
	
	logic [1:0]  D;
	logic [1:0]  Q;
	
	logic [11:0] matrix_Q [3:0][3:0];
	
	logic [11:0] summed_matrix  [3:0][3:0];
	logic [11:0] moved_matrix   [3:0][3:0];
	
	logic summed_r;
	logic moved_r;
	
	
	// Current State logic 
	current_state_summation  current_state(.clk(clk),
										   .rst(rst),
										   .enable(enable),
										   .initial_matrix(matrix),
										   .D(D),
										   .matrix_D(matrix_D),
							  			   .Q(Q),
										   .matrix_Q(matrix_Q));
												
								
	summation sum_sum (direction,
					   matrix_Q,
					   summed_matrix,
				       summed_r);
	
	movement move_sum (direction,
					   matrix_Q,
					   0,
					   moved_matrix,
					   moved_r);
	
	
	mux_2MtoM m2mtom_sum (summed_matrix,
						  moved_matrix,
						  Q[0],
						  matrix_D);

	mux_2to1  m2to1_sum  (summed_r,
						  moved_r,
						  Q[0],
						  r);


	// Next State Logic
	next_state_summation next_state (/*.clk(clk),
									 .enable(enable),*/
									 .Q(Q),
									 .r(r),
									 .D(D));


endmodule
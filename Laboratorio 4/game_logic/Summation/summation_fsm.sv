/*
Summation FSM
*/
module summation_fsm (clk, rst, enable, outer_state, direction, matrix, matrix_D, r);

	input  logic 		clk, rst, enable;
	input  logic [3:0]  direction;
	input  logic [1:0]  outer_state;
	input  logic [11:0] matrix   [3:0][3:0];
	output logic [11:0] matrix_D [3:0][3:0];
	output logic 		r;

	logic module_enable;
	
	logic [1:0]  D;
	logic [1:0]  Q;
	
	logic [11:0] matrix_Q [3:0][3:0];
	
	logic [11:0] summed_matrix  [3:0][3:0];
	logic [11:0] moved_matrix   [3:0][3:0];
	
	logic summed_r;
	logic moved_r;
	
	logic mux_sel;
/*
	// assign module_enable = outer_state[1] & !outer_state[0];
	module_enable_summation mes (outer_state, module_enable);

	// Current State logic 
	current_state_summation  current_state(.clk(clk),
										   .rst(rst),
										   .enable(enable),
										   .module_enable(module_enable),
										   .initial_matrix(matrix),
										   .D(D),
										   .matrix_D(matrix_D),
							  			   .Q(Q),
										   .matrix_Q(matrix_Q));
												
	
		// Next State Logic
	next_state_summation next_state (.Q(Q),
									 .r(r),
									 .D(D));

	
								
	summation sum_sum (clk,
					   module_enable,
					   direction,
					   matrix_Q,
					   summed_matrix,
				       summed_r);
	
	movement move_sum (clk,
					   module_enable,
					   direction,
					   summed_matrix,
					   //matrix_Q,
					   moved_matrix,
					   moved_r);
	
	
	mux_2MtoM m2mtom_sum (clk,
						  summed_matrix,
						  moved_matrix,
						  mux_sel,
						  matrix_D);

	mux_2to1  m2to1_sum  (summed_r,
						  moved_r,
						  mux_sel,
						  r);


	// Outputs Logic
	outputs_summation outputs (.Q(Q),
							   .ms(mux_sel));
*/

endmodule

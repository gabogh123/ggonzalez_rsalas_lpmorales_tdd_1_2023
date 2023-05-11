/*
Movement Logic FSM
*/
module movement_fsm(clk, rst, enable, direction, matrix, matrix_D, r);

	input  logic 		clk, rst, enable;
	input  logic  [3:0] direction;
	input  logic [11:0] matrix 	 [3:0][3:0];
	output logic [11:0] matrix_D [3:0][3:0];
	output logic 		r;
	

	logic [1:0]  D;
	logic [1:0]  Q;

	logic [11:0] matrix_Q [3:0][3:0];

	logic [11:0] pre_moved_matrix_0 [3:0][3:0];
	logic [11:0] pre_moved_matrix_1 [3:0][3:0];
	logic [11:0] pre_moved_matrix_2 [3:0][3:0];
	logic [11:0] pre_moved_matrix_3 [3:0][3:0];
	
	logic ready_0, ready_1, ready_2, ready_3;

	logic [1:0] mux_sel;

	// logic move_enable(Q, r, move_enable);
	
	/*
	actual_state_movement current_state(.clk(clk),
										.rst(rst),
										.enable(enable),
										.initial_matrix(matrix),
										.D(D),
										.matrix_D(matrix_D),
										.Q(Q),
										.matrix_Q(matrix_Q));


	next_state_movement next_state (.Q(Q),
									.r(r),
									.D(D));


	movement m00 (clk, direction, matrix_Q, pre_moved_matrix_0, ready_0);
	movement m01 (clk, direction, matrix_Q, pre_moved_matrix_1, ready_1);
	movement m10 (clk, direction, matrix_Q, pre_moved_matrix_2, ready_2);
	movement m11 (clk, direction, matrix_Q, pre_moved_matrix_3, ready_3);


	mux_4MtoM m4MtoM (clk,
					  pre_moved_matrix_0,
					  pre_moved_matrix_1,
					  pre_moved_matrix_2,
					  pre_moved_matrix_3,
					  mux_sel,
					  matrix_D);


	mux_4to1 m4to1 (ready_0,
					ready_1,
					ready_2,
					ready_3,
					mux_sel,
					r);

	/*
	always_comb
		case (Q)
		
			3'b000:  r = ready_0;
			3'b001:  r = ready_1;
			3'b010:  r = ready_2;
			3'b011:  r = ready_3;
			default: r = 1'b1;
			
		endcase*
	
	outputs_movement outputs (.Q(D),
							  .ms(mux_sel));
	*/

endmodule

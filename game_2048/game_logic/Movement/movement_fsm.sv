/*
Movement Logic FSM
*/
module movement_fsm(clk, rst, direction, matrix, moved_matrix);

	input  logic clk, rst;
	input  logic [3:0]  direction;
	input  logic [11:0] matrix 		[3:0][3:0];
	output logic [11:0] moved_matrix [3:0][3:0];
	
	logic Q2, Q1, Q0, r, D2, D1, D0;
	
	actual_state_movement actual (clk, rst, D2, D1, D0, Q2, Q1, Q0);
	
	
	logic [11:0] pre_moved_matrix_0 [3:0][3:0];
	logic [11:0] pre_moved_matrix_1 [3:0][3:0];
	logic [11:0] pre_moved_matrix_2 [3:0][3:0];
	logic [11:0] pre_moved_matrix_3 [3:0][3:0];
	
	logic ready_0, ready_1, ready_2, ready_3;
	
	movement m00 (direction, matrix, 			 1'b0, 	  pre_moved_matrix_0, ready_0);
	movement m01 (direction, pre_moved_matrix_0, ready_0, pre_moved_matrix_1, ready_1);
	movement m10 (direction, pre_moved_matrix_1, ready_1, pre_moved_matrix_2, ready_2);
	movement m11 (direction, pre_moved_matrix_2, ready_2, pre_moved_matrix_3, ready_3);

	
	always_comb
		case ({Q2, Q1, Q0})
		
			3'b000:  r = ready_0;
			3'b001:  r = ready_1;
			3'b010:  r = ready_2;
			3'b011:  r = ready_3;
			default: r = 1'b1;
			
		endcase
	
	next_state_movement next (Q2, Q1, Q0, r, D2, D1, D0);
	outputs_movement salidas(Q2, Q1, Q0, M1, M0);
	
	mux_4MtoM m4MtoM (pre_moved_matrix_0,
					  pre_moved_matrix_1,
					  pre_moved_matrix_2,
					  pre_moved_matrix_3,
					  {M1, M0},
					  moved_matrix);

endmodule
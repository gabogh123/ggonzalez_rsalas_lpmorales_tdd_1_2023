
module logic_manager_2 (clk, rst, moved_matrix);
// module movement_fsm(clk, rst, direction, matrix, moved_matrix);

	input  logic clk, rst;
	
	
	output logic [11:0] moved_matrix [3:0][3:0];
	
	
	logic [11:0] test_matrix_1 [3:0][3:0] = '{ '{12'd0, 12'd2, 12'd4, 12'd0},
															 '{12'd2, 12'd0, 12'd8, 12'd8},
															 '{12'd4, 12'd8, 12'd2, 12'd0},
															 '{12'd0, 12'd0, 12'd8, 12'd4}  
														 };
														 
	logic [3:0]  direction = 4'b0001;
	
														 
	movement_fsm fsm_ut (clk, rst, direction, test_matrix_1, moved_matrix);


	
	
endmodule
	
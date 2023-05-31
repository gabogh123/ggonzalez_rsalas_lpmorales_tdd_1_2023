module logic_manager_check (goal, matrix, W, L);

	input  logic [3:0]  goal;
	input  logic [11:0] matrix [3:0][3:0];
	output logic W;
	output logic L;
	
	/* Test #1 : */
	
	logic [3:0]  test_goal_1 = 4'b1001;
	logic [11:0] test_matrix_1 [3:0][3:0] = '{ '{  12'd0,   12'd2,    12'd4,    12'd8},
											   '{12'd256, 12'd512, 12'd1024, 12'd2048},
											   '{  12'd0,   12'd8,   12'd32,  12'd512},
											   '{12'd128,  12'd64,   12'd32,   12'd16} };
															
	logic [11:0] test_checked_matrix_1 [3:0][3:0];
	logic W1;
	logic L1;
	
	check chk_1 (test_goal_1, test_matrix_1, test_checked_matrix_1, W1, L1);
	
	
	/* Test #2 : */
	
	logic [3:0]  test_goal_2 = 4'b1001;
	logic [11:0] test_matrix_2 [3:0][3:0] = '{ '{  12'd0,   12'd2,    12'd4,    12'd8},
											   '{12'd256, 12'd512, 12'd1024, 12'd2048},
											   '{  12'd0,   12'd8,   12'd32,  12'd512},
											   '{12'd128,  12'd64,   12'd32,   12'd16} };
															
	logic [11:0] test_checked_matrix_2 [3:0][3:0];
	logic W2;
	logic L2;
	
	check chk_2 (test_goal_2, test_matrix_2, test_checked_matrix_2, W2, L2);

endmodule

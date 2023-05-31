module logic_manager_sum (goal, direction, matrix);

	input  logic [3:0]  goal;
	input  logic [3:0]  direction;
	output logic [11:0] matrix [3:0][3:0];
	
	
	logic [3:0] test_direction_1  = 4'b1000; // LEFT
	logic [11:0] test_matrix_1 [3:0][3:0] = '{ '{12'd0, 12'd2, 12'd4, 12'd4},
															 '{12'd2, 12'd2, 12'd8, 12'd8},
															 '{12'd0, 12'd8, 12'd8, 12'd0},
															 '{12'd4, 12'd4, 12'd8, 12'd4}  
														 };
		
	//wire [11:0] test_adjusted_matrix_1 [3:0][3:0];
		
	logic [11:0] output_matrix_1 [3:0][3:0];
	logic ready_1;
	
	/*
	direction_adjuster sda_1 (.direction(test_direction_1),
									.matrix(test_matrix_1),
									.adjusted_matrix(test_adjusted_matrix_1));*/
									
	summation s_1 (test_direction_1, test_matrix_1, output_matrix_1, ready_1);
	
	
	
	
	
	logic [3:0] test_direction_2  = 4'b0010; // UP
	logic [11:0] test_matrix_2 [3:0][3:0] = '{ '{12'd2, 12'd2, 12'd4, 12'd4},
															 '{12'd2, 12'd8, 12'd8, 12'd8},
															 '{12'd0, 12'd8, 12'd8, 12'd16},
															 '{12'd0, 12'd0, 12'd0, 12'd16}  
														 };
		
	//wire [11:0] test_adjusted_matrix_2 [3:0][3:0];
		
	logic [11:0] output_matrix_2 [3:0][3:0];
	logic ready_2;
	
	/*
	direction_adjuster sda_2 (.direction(test_direction_2),
									.matrix(test_matrix_2),
									.adjusted_matrix(test_adjusted_matrix_2));*/
									
	summation s_2 (test_direction_2, test_matrix_2, output_matrix_2, ready_2);
	
endmodule

module logic_manager (goal, direction, matrix);

	input logic [3:0] goal;
	input logic [3:0] direction;
	output logic [11:0] matrix [3:0][3:0];
	
	//logic [11:0] test_matrix [3:0][3:0];
	
	
	
	/* modulo que genere posiciones aleatorias para la matriz */
	
	
	logic [11:0] test_matrix_1 [3:0][3:0] = '{ '{12'd0, 12'd2, 12'd4, 12'd8},
														    '{12'd2, 12'd0, 12'd8, 12'd0},
														    '{12'd4, 12'd8, 12'd2, 12'd4},
														    '{12'd0, 12'd0, 12'd0, 12'd0}  
														 };
														 
	logic [11:0] output_matrix_1 [3:0][3:0];
	
						
	movement m_1 (direction, test_matrix_1, output_matrix_1);
	
	logic [11:0] test_matrix_2 [3:0][3:0] = '{ '{12'd0, 12'd0, 12'd0, 12'd0},
														    '{12'd0, 12'd0, 12'd0, 12'd0},
														    '{12'd4, 12'd0, 12'd0, 12'd0},
														    '{12'd0, 12'd0, 12'd2, 12'd0}  
														 };
	
	logic [11:0] output_matrix_2 [3:0][3:0];
	
	movement m_2 (direction, test_matrix_2, output_matrix_2);
						
	

endmodule
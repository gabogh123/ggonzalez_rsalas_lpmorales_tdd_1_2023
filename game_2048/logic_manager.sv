module logic_manager (goal, direction, matrix);

	input  logic [3:0]  goal;
	input  logic [3:0]  direction;
	output logic [11:0] matrix [3:0][3:0];

	
	logic for_sum = 0;
	
	logic ready_1;
	logic [3:0] test_direction_1  = 4'b1000; // LEFT
	logic [11:0] test_matrix_1 [3:0][3:0] = '{ '{12'd0, 12'd2, 12'd4, 12'd0},
															 '{12'd2, 12'd0, 12'd8, 12'd8},
															 '{12'd4, 12'd8, 12'd2, 12'd0},
															 '{12'd0, 12'd0, 12'd8, 12'd4}  
														 };													 
	logic [11:0] output_matrix_1 [3:0][3:0];					
	movement m_1 (test_direction_1, test_matrix_1, for_sum, output_matrix_1, ready_1);
	
	
	
	logic ready_7;
	logic [3:0] test_direction_7  = 4'b0100; // DOWN
	logic [11:0] test_matrix_7 [3:0][3:0] = '{ '{12'd0, 12'd2, 12'd4, 12'd0},
															 '{12'd2, 12'd0, 12'd8, 12'd8},
															 '{12'd4, 12'd8, 12'd2, 12'd0},
															 '{12'd0, 12'd0, 12'd8, 12'd4}  
														 };													 
	logic [11:0] output_matrix_7 [3:0][3:0];					
	movement m_7 (test_direction_7, test_matrix_7, for_sum, output_matrix_7, ready_7);
	
	
	
	logic ready_8;
	logic [3:0] test_direction_8  = 4'b0010; // UP
	logic [11:0] test_matrix_8 [3:0][3:0] = '{ '{12'd0, 12'd2, 12'd4, 12'd0},
															 '{12'd2, 12'd0, 12'd8, 12'd8},
															 '{12'd4, 12'd8, 12'd2, 12'd0},
															 '{12'd0, 12'd0, 12'd8, 12'd4}  
														 };	
	logic [11:0] output_matrix_8 [3:0][3:0];
	movement m_8 (test_direction_8, test_matrix_8, for_sum, output_matrix_8, ready_8);
	
	
	
	logic ready_2;
	logic [3:0] test_direction_2  = 4'b0001; // RIGHT
	logic [11:0] test_matrix_2 [3:0][3:0] = '{ '{12'd0, 12'd2, 12'd4, 12'd0},
															 '{12'd2, 12'd0, 12'd8, 12'd8},
															 '{12'd4, 12'd8, 12'd2, 12'd0},
															 '{12'd0, 12'd0, 12'd8, 12'd4}  
														 };	
	logic [11:0] output_matrix_2 [3:0][3:0];
	movement m_2 (test_direction_2, test_matrix_2, for_sum, output_matrix_2, ready_2);
	
	
	
	/*
	logic ready_3;
	logic [3:0] test_direction_3  = 4'b0001;
	logic [11:0] test_matrix_3 [3:0][3:0] = '{ '{12'd11, 12'd12, 12'd13, 12'd14},
															 '{12'd21, 12'd22, 12'd23, 12'd24},
															 '{12'd31, 12'd32, 12'd33, 12'd34},
															 '{12'd41, 12'd42, 12'd43, 12'd44}  
														 };												 
	logic [11:0] output_matrix_3 [3:0][3:0];				
	movement m_3 (test_direction_3, test_matrix_3, for_sum, output_matrix_3, ready_3);
	
	

	logic ready_5;
	logic [3:0] test_direction_5  = 4'b0010;
	logic [11:0] test_matrix_5 [3:0][3:0] = '{ '{12'd11, 12'd12, 12'd13, 12'd14},
															 '{12'd21, 12'd22, 12'd23, 12'd24},
															 '{12'd31, 12'd32, 12'd33, 12'd34},
															 '{12'd41, 12'd42, 12'd43, 12'd44}  
														 };												 
	logic [11:0] output_matrix_5 [3:0][3:0];				
	movement m_5 (test_direction_5, test_matrix_5, for_sum, output_matrix_5, ready_5);
	
	
	
	logic ready_6;
	logic [3:0] test_direction_6  = 4'b0100;
	logic [11:0] test_matrix_6 [3:0][3:0] = '{ '{12'd11, 12'd12, 12'd13, 12'd14},
															 '{12'd21, 12'd22, 12'd23, 12'd24},
															 '{12'd31, 12'd32, 12'd33, 12'd34},
															 '{12'd41, 12'd42, 12'd43, 12'd44}  
														 };												 
	logic [11:0] output_matrix_6 [3:0][3:0];				
	movement m_6 (test_direction_6, test_matrix_6, for_sum, output_matrix_6, ready_6);
	
	
	
	logic ready_4;	
	logic [3:0] test_direction_4  = 4'b1000;
	logic [11:0] test_matrix_4 [3:0][3:0] = '{ '{12'd11, 12'd12, 12'd13, 12'd14},
															 '{12'd21, 12'd22, 12'd23, 12'd24},
															 '{12'd31, 12'd32, 12'd33, 12'd34},
															 '{12'd41, 12'd42, 12'd43, 12'd44}  
														 };												 
	logic [11:0] output_matrix_4 [3:0][3:0];				
	movement m_4 (test_direction_4, test_matrix_4, for_sum, output_matrix_4, ready_4);
	*/
	
	

endmodule
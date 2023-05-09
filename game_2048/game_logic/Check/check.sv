
module check (clk, goal, matrix, checked_matrix, W, L);

	input  logic 		clk;
	input  logic [3:0]  goal;
	input  logic [11:0] matrix [3:0][3:0];
	output logic [11:0] checked_matrix [3:0][3:0];
	output logic 		W;
	output logic 		L;
	
	goal_checker g_check (clk, goal, matrix, W);
	movement_posibility_checker mp_check (clk, matrix, L);

	assign checked_matrix = matrix;
	
endmodule

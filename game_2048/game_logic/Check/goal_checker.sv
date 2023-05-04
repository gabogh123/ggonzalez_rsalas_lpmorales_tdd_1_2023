module goal_checker(goal, matrix, W);

	input  logic [3:0]  goal;
	input  logic [11:0] matrix [3:0][3:0];
	output logic 		  W;
	
	initial begin
	
		W = 0;
	
		for (int i = 0; i < $size(matrix); i++) begin
				for (int j = 0; j < $size(matrix); j++) begin
					
					if (goal == matrix[i][j]) begin
						W = 1;
						break;
					end
					
				end
			end
	
	end

endmodule

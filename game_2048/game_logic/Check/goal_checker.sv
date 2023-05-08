module goal_checker(goal, matrix, W);

	input  logic [3:0]  goal;
	input  logic [11:0] matrix [3:0][3:0];
	output logic 		  W;
	
	initial begin
	// always @ (matrix) begin
	
		W = 0;
	
		for (int i = 0; i < 4; i++) begin
			$display("%p", matrix[i][3:0]);
			for (int j = 0; j < 4; j++) begin
				
				if ((2 ** (goal + 4'b0010)) == matrix[i][j]) begin
					W = 1;
					break;
				end
				
			end
		end
		
		$display("\ngoal @ goal_checker: %d", (2 ** (goal + 4'b0010)));

	end

endmodule

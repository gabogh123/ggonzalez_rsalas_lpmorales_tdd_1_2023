module goal_checker(clk, goal, matrix, W);

	input  logic 		clk;
	input  logic [3:0]  goal;
	input  logic [11:0] matrix [3:0][3:0];
	output logic 		W;
	
	// initial begin
	always_ff @ (posedge clk) begin
	
		W = 0;
	
		for (int i = 0; i < 4; i++) begin
			for (int j = 0; j < 4; j++) begin
				
				if ((2 ** (goal + 4'b0010)) == matrix[i][j]) begin
					W = 1;
					break;
				end
				
			end
		end

	end

endmodule

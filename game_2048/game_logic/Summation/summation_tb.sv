module summation_tb;

   logic [3:0] goal;
	logic [3:0] direction;

	logic [11:0] test_matrix [3:0][3:0];

														  
	logic_manager_sum uut (goal, direction, test_matrix);
	
	
	initial begin
	 
		 goal = 4'b1000;
		 #10
		 
		 goal = 4'b0100;
		 #10
		 
		 goal = 4'b0010;
		 #10
		 
		 goal = 4'b0001;
		 #10;
	 
	 end

endmodule

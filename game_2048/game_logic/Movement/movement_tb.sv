/*
Movement FSM Test Bench
*/
module movement_tb();

	logic 		 clk;
	logic 		 enable;
	logic [3:0]  direction;
	logic [11:0] matrix [3:0][3:0];
	logic [11:0] moved_matrix [3:0][3:0];
	logic		 ready;

	movement uut (clk, enable, direction, matrix, moved_matrix, ready);
	
	initial begin
		$display("Inicia sistema");

		
		clk = 0;
		enable = 0;
		direction = 4'b0000;
		matrix = '{'{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0}};

	end

	always
		#10 clk = !clk;
		
	initial begin

		$display("Inicio again ..");

		#20

		enable = 1;
	
		#20
		matrix = '{'{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd4, 12'd2, 12'd0},
				   '{12'd0, 12'd8, 12'd8, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0}};
		

		#80

		direction = 4'b0001;
		
		#70

		$display("matrix:\n%p\n%p\n%p\n%p\n", 		 matrix[3][3:0], matrix[2][3:0],
											   		 matrix[1][3:0], matrix[0][3:0],
				 "summed_matrix:\n%p\n%p\n%p\n%p\n", moved_matrix[3][3:0], moved_matrix[2][3:0],
													 moved_matrix[1][3:0], moved_matrix[0][3:0],
				 "Ready: %b\n\n\n", ready);

		#10

		direction = 4'b0010;

		#70

		$display("matrix:\n%p\n%p\n%p\n%p\n", 		 matrix[3][3:0], matrix[2][3:0],
											   		 matrix[1][3:0], matrix[0][3:0],
				 "summed_matrix:\n%p\n%p\n%p\n%p\n", moved_matrix[3][3:0], moved_matrix[2][3:0],
													 moved_matrix[1][3:0], moved_matrix[0][3:0],
				 "Ready: %b\n\n\n", ready);

		#10
		
		direction = 4'b0100;

		#70

		$display("matrix:\n%p\n%p\n%p\n%p\n", 		 matrix[3][3:0], matrix[2][3:0],
											   		 matrix[1][3:0], matrix[0][3:0],
				 "summed_matrix:\n%p\n%p\n%p\n%p\n", moved_matrix[3][3:0], moved_matrix[2][3:0],
													 moved_matrix[1][3:0], moved_matrix[0][3:0],
				 "Ready: %b\n\n\n", ready);

		#10

		direction = 4'b1000;

		#70

		$display("matrix:\n%p\n%p\n%p\n%p\n", 		 matrix[3][3:0], matrix[2][3:0],
											   		 matrix[1][3:0], matrix[0][3:0],
				 "summed_matrix:\n%p\n%p\n%p\n%p\n", moved_matrix[3][3:0], moved_matrix[2][3:0],
													 moved_matrix[1][3:0], moved_matrix[0][3:0],
				 "Ready: %b\n\n\n", ready);

		#10;


	end

	initial
	#1000 $finish;
	

endmodule

module summation_tb();

	logic clk;
	logic enable;
	logic [3:0] direction;
	logic [11:0] matrix [3:0][3:0];
	logic [11:0] summed_matrix [3:0][3:0];
	logic ready;

	logic [11:0] a_matrix [3:0][3:0];
														  
	summation uut (clk, enable, direction, matrix, summed_matrix, ready);
	
	
	initial begin
		$display("Inicia sistema");/*
		$monitor("direction: %b\nmatrix:\n%p\n%p\n%p\n%p\nadjusted_matrix:\n%p\n%p\n%p\n%p\ntemp_matrix:\n%p\n%p\n%p\n%p\nready: %b",
					uut.direction,
					uut.matrix[0][3:0], uut.matrix[1][3:0],
					uut.matrix[2][3:0], uut.matrix[3][3:0],
					uut.adjusted_matrix[0][3:0], uut.adjusted_matrix[1][3:0],
					uut.adjusted_matrix[2][3:0], uut.adjusted_matrix[3][3:0],
					uut.temp_matrix[0][3:0], uut.temp_matrix[1][3:0],
					uut.temp_matrix[2][3:0], uut.temp_matrix[3][3:0],
					uut.ready);*/
		
		 $monitor("matrix:\n%p\n%p\n%p\n%p\n", matrix[3][3:0], matrix[2][3:0],
											   matrix[1][3:0], matrix[0][3:0],
			 		"summed_matrix:\n%p\n%p\n%p\n%p\n", summed_matrix[3][3:0], summed_matrix[2][3:0],
												  	 summed_matrix[1][3:0], summed_matrix[0][3:0],
			 		"Ready: %b\n", ready);
				
		
		clk = 0;
		enable = 0;
		direction = 4'b0000;
		matrix = '{'{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0}};
	end

	always begin
		#10 clk = !clk;
	end
		
	initial begin
		
		#100
		matrix = '{'{12'd2, 12'd2, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0}};
		#100
		direction = 4'b1000;
		#100
		enable = 1;
		



		#100

		a_matrix = '{'{12'd4, 12'd0, 12'd0, 12'd0},
				     '{12'd4, 12'd0, 12'd0, 12'd0},
				     '{12'd4, 12'd0, 12'd0, 12'd0},
				     '{12'd4, 12'd0, 12'd0, 12'd0}};

		#5
    	assert(summed_matrix === a_matrix) else $error("01 failed");
		#5

		enable = 0;
		#100

		matrix = '{'{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0}};
		#100
		direction = 4'b0100;

		#100
		enable = 1;

		#100

		a_matrix = '{'{12'd0, 12'd0, 12'd0, 12'd0},
					 '{12'd8, 12'd0, 12'd0, 12'd0},
					 '{12'd0, 12'd0, 12'd0, 12'd0},
					 '{12'd8, 12'd0, 12'd0, 12'd0}};

		#5
    	assert(summed_matrix === a_matrix) else $error("01 failed");

		#100;

	end

	initial
	#1000 $finish;
	

endmodule

module check_tb;

	logic clk;
    logic [3:0] goal;
	logic [11:0] matrix [3:0][3:0];
	logic [11:0] checked_matrix [3:0][3:0];
	logic W;
	logic L;

														  
	check uut (clk, goal, matrix, checked_matrix, W, L);
	
	
	initial begin
		$display("Inicia sistema");/*
		$monitor("goal: %b\nmatrix:\n%p\n%p\n%p\n%p\nchecked_matrix:\n%p\n%p\n%p\n%p\nW: %b - L: %b",
					uut.goal,
					uut.matrix[0][3:0], uut.matrix[1][3:0],
					uut.matrix[2][3:0], uut.matrix[3][3:0],
					uut.checked_matrix[0][3:0], uut.checked_matrix[1][3:0],
					uut.checked_matrix[2][3:0], uut.checked_matrix[3][3:0],
					uut.W, uut.L);*/

		clk = 0;
		goal = 4'b0000;
		matrix = '{'{12'd0, 12'd0, 12'd0, 12'd0},
				    '{12'd0, 12'd0, 12'd0, 12'd0},
				    '{12'd0, 12'd0, 12'd0, 12'd0},
				    '{12'd0, 12'd0, 12'd0, 12'd0}};
	end

	always begin
		#10 clk = !clk;
	end
		
	initial begin
		
		#40
		goal = 4'b1000;
		#100
		matrix = '{'{12'd2, 12'd2, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0}};
		#40
		$display("\nW: %b - L: %b", W, L);
		#10


		goal = 4'b0011;
		#100
		matrix = '{'{12'd2,  12'd2, 12'd32, 12'd0},
				   '{12'd4, 12'd16, 12'd16, 12'd0},
				   '{12'd4,  12'd2,  12'd8, 12'd8},
				   '{12'd4,  12'd0,  12'd0, 12'd0}};
		#40
		$display("\nW: %b - L: %b", W, L);
		#10


		goal = 4'b0111;
		#100
		matrix = '{'{ 12'd2,  12'd4, 12'd32,  12'd64},
				   '{12'd16, 12'd32, 12'd16, 12'd128},
				   '{ 12'd4,  12'd2,  12'd8,  12'd32},
				   '{ 12'd8,  12'd4,  12'd2,  12'd16}};

		#100;

		#40
		$display("\nW: %b - L: %b", W, L);
		#10;

	end

	initial
	#1000 $finish;
	

endmodule
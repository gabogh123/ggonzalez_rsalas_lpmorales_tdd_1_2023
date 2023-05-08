module summation_fsm_tb();

	logic clk, rst, enable;
	logic [3:0]  direction;
	logic [11:0] matrix   [3:0][3:0];
	logic [11:0] matrix_D [3:0][3:0];
	logic 		 r;
	

	summation_fsm fsmut (clk, rst, enable, direction, matrix, matrix_D, r);
	
	
	initial begin
		$display("Inicia sistema");/*
		$monitor("direction: %b\nmatrix:\n%p\n%p\n%p\n%p\nsummed_matrix:\n%p\n%p\n%p\n%p\nmoved_matrix:\n%p\n%p\n%p\n%p\nready: %b",
					fsmut.direction,
					fsmut.matrix[0][3:0], fsmut.matrix[1][3:0],
					fsmut.matrix[2][3:0], fsmut.matrix[3][3:0],
					fsmut.summed_matrix[0][3:0], fsmut.summed_matrix[1][3:0],
					fsmut.summed_matrix[2][3:0], fsmut.summed_matrix[3][3:0],
					fsmut.moved_matrix[0][3:0], fsmut.moved_matrix[1][3:0],
					fsmut.moved_matrix[2][3:0], fsmut.moved_matrix[3][3:0],
					fsmut.r);*/

		$monitor("direction: %b\nmatrix:\n%p\n%p\n%p\n%p\nmatrix_D:\n%p\n%p\n%p\n%p\nready: %b",
					direction,
					matrix[0][3:0], matrix[1][3:0],
					matrix[2][3:0], matrix[3][3:0],
					fsmut.m2mtom_sum.OM[0][3:0], fsmut.m2mtom_sum.OM[1][3:0],
					fsmut.m2mtom_sum.OM[2][3:0], fsmut.m2mtom_sum.OM[3][3:0],
					r);
		
		clk = 0;
		rst = 0;
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

		#40 rst = 1;
		#20 rst = 0;
		
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
		enable = 0;

		#100
		rst = 1;
		#20
		rst = 0;

		#100
		matrix = '{'{12'd2, 12'd2, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd8, 12'd8},
				   '{12'd4, 12'd0, 12'd0, 12'd0}};
		#100
		direction = 4'b0100;

		#100
		enable = 1;

		#100
		enable = 0;

		#100
		rst = 1;
		#20
		rst = 0;
		
	end
	
	initial
	#2000 $finish;

endmodule

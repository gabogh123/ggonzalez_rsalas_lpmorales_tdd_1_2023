/*
Movement FSM Test Bench
*/
module movement_tb();

	logic clk;
	logic [3:0]  direction;
	logic [11:0] matrix [3:0][3:0];
	logic [11:0] moved_matrix [3:0][3:0];
	logic ready;

	movement uut (clk, direction, matrix, moved_matrix, ready);
	
	initial begin
		$display("Inicia sistema");
		$monitor("direction: %b\nmatrix:\n%p\n%p\n%p\n%p\nmoved_matrix:\n%p\n%p\n%p\n%p\nready: %b",
					uut.direction,
					uut.matrix[0][3:0], uut.matrix[1][3:0],
					uut.matrix[2][3:0], uut.matrix[3][3:0],
					uut.moved_matrix[0][3:0], uut.moved_matrix[1][3:0],
					uut.moved_matrix[2][3:0], uut.moved_matrix[3][3:0],
					uut.ready);
		
		clk = 0;
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
		
		#100
		matrix = '{'{12'd2, 12'd2, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0}};
		#100
		direction = 4'b0001;



		#100
		matrix = '{'{12'd2, 12'd2, 12'd0, 12'd1},
				   '{12'd4, 12'd0, 12'd2, 12'd0},
				   '{12'd4, 12'd8, 12'd8, 12'd8},
				   '{12'd4, 12'd0, 12'd0, 12'd0}};
		#100
		direction = 4'b0100;

		#100;

	end

	initial
	#1000 $finish;
	

endmodule

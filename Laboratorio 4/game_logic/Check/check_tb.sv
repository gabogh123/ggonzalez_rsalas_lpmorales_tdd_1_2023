module check_tb;

	logic enable;
    logic [3:0] goal;
	logic [11:0] matrix [3:0][3:0];
	logic [11:0] checked_matrix [3:0][3:0];
	logic W;
	logic L;

														  
	check uut (enable, goal, matrix, checked_matrix, W, L);
	
	
	initial begin
		$display("Inicia sistema");

		enable = 0;
		goal = 4'b0000;
		matrix = '{ '{12'd0, 12'd0, 12'd0, 12'd0},
				    '{12'd0, 12'd0, 12'd0, 12'd0},
				    '{12'd0, 12'd0, 12'd0, 12'd0},
				    '{12'd0, 12'd0, 12'd0, 12'd0}};
	end
		
	initial begin
		
		#40
		enable = 1;
		#40
		goal = 4'b1000;
		#100
		matrix = '{'{  12'd2,   12'd2,  12'd0, 12'd32},
				   '{12'd258, 12'd516, 12'd16, 12'd16},
				   '{12'd516,   12'd0,  12'd4,  12'd0}, 
				   '{  12'd0, 12'd128,  12'd4,  12'd2}};
		#40
		/* W: = 00 */
		$display("\n\n\nmatrix:\n%p\n%p\n%p\n%p\n", matrix[3][3:0], matrix[2][3:0],
											   matrix[1][3:0], matrix[0][3:0],
				 "W: %b - L: %b", W, L);
		
		assert(W === 0 & L === 0) $display ("OK. WL = 00"); else $error("WL = 00: failed");
		#10


		goal = 4'b0100;
		#100
		matrix = '{'{ 12'd4,  12'd0, 12'd32, 12'd0},
				   '{ 12'd0, 12'd64, 12'd32, 12'd2},
				   '{12'd16,  12'd0,  12'd0, 12'd4},
				   '{ 12'd8,  12'd8,  12'd2, 12'd0}};
		#40
		/* WL = 10 */
		$display("\n\n\nmatrix:\n%p\n%p\n%p\n%p\n", matrix[3][3:0], matrix[2][3:0],
											   matrix[1][3:0], matrix[0][3:0],
				 "W: %b - L: %b", W, L);
		assert(W === 1 & L === 0) $display ("OK. WL = 10"); else $error("WL = 10: failed");
		#10


		goal = 4'b0111;
		#100
		matrix = '{'{ 12'd2,  12'd4, 12'd32,  12'd64},
				   '{12'd16, 12'd32, 12'd16, 12'd128},
				   '{ 12'd4,  12'd2,  12'd8,  12'd32},
				   '{ 12'd8,  12'd4,  12'd2,  12'd16}};

		#100;

		#40
		/* WL = 01 */
		$display("\n\n\nmatrix:\n%p\n%p\n%p\n%p\n", matrix[3][3:0], matrix[2][3:0],
											   matrix[1][3:0], matrix[0][3:0],
				 "W: %b - L: %b", W, L);
		assert(W === 0 & L === 1) $display ("OK. WL = 01"); else $error("WL = 01: failed");
		#10;

	end

	initial
	#1000 $finish;
	

endmodule
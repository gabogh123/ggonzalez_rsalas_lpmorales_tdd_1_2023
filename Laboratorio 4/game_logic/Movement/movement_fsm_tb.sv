/*
Movement FSM Test Bench
*/
module movement_fsm_tb();

	logic clk, rst, enable;
	logic [3:0]  direction;
	logic [11:0] matrix   [3:0][3:0];
	logic [11:0] matrix_D [3:0][3:0];
	logic 		 r;
	
	movement_fsm fsmut (clk, rst, enable, direction, matrix, matrix_D, r);
	
	
	initial begin
		$display("Inicia sistema");
/*
		$monitor("Current State: %b\ndirection: %b\nmatrix:\n%p\n%p\n%p\n%p\nmatrix_D:\n%p\n%p\n%p\n%p\nready: %b",
					fsmut.Q,
					direction,
					matrix[0][3:0], matrix[1][3:0],
					matrix[2][3:0], matrix[3][3:0],
					matrix_D[0][3:0], matrix_D[1][3:0],
					matrix_D[2][3:0], matrix_D[3][3:0],
					r);*/
		
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

		$display("Inicio again ..");

		#40 rst = 1;
		#20 rst = 0;
		
		#300
		matrix = '{'{12'd2, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd4, 12'd0, 12'd0},
				   '{12'd8, 12'd0, 12'd8, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd2}};

		

		#50

		$display("\nMatrix 1:");
		for (int i = 0; i < 4; i++) begin
			$display("%p", matrix[i][3:0]);
		end


		direction = 4'b0001;

		#50
		enable = 1;

		#300

		$display("\nMatrix 1 result:");
		for (int i = 0; i < 4; i++) begin
			$display("%p", matrix_D[i][3:0]);
		end

		enable = 0;

		#100
		rst = 1;
		#40
		rst = 0;

		#40
		matrix = '{'{12'd2, 12'd2, 12'd0, 12'd4},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd8, 12'd8},
				   '{12'd4, 12'd0, 12'd0, 12'd0}};
		#50

		$display("\nMatrix 2:");
		for (int i = 0; i < 4; i++) begin
			$display("%p", matrix[i][3:0]);
		end


		direction = 4'b0100;

		#50
		enable = 1;

		#300

		$display("\nMatrix 2 result:");
		for (int i = 0; i < 4; i++) begin
			$display("%p", matrix_D[i][3:0]);
		end

		#300
		enable = 0;

		#100
		rst = 1;
		#40
		rst = 0;
		
	end
	
	initial
	#2000 $finish;

endmodule


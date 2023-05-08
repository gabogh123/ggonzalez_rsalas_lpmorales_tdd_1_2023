module summation_fsm_tb();

	logic clk, rst, enable;
	logic [3:0]  direction;
	logic [11:0] matrix   [3:0][3:0];
	logic [11:0] matrix_D [3:0][3:0];
	logic 		 r;
	
	
	summation_fsm fsmut (clk, rst, enable, direction, matrix, matrix_D, r);
	
	
	initial begin
		$display("Inicia sistema");
		
		clk = 0;
		rst = 0;
		enable = 0;
		direction = 4'b0000;
		matrix <= '{'{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0}};
	end

	always
		#1000 clk = !clk;
		
	initial begin

		$display("Inicio again ..");

		#2000 rst = 1;
		#2000 rst = 0;
		
		#1000
		matrix <= '{'{12'd2, 12'd2, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0}};
		#1000
		direction = 4'b1000;
		
		#2000
		enable = 1;

		#10000



		enable = 0;

		$display("matrix:");
		for (int i = 3; i > -1; i--) begin
			$display("%p", matrix[i][3:0]);
		end
		$display("\n\ndirection: %b", direction);
		$display("matrix_D:");
		for (int i = 3; i > -1; i--) begin
			$display("%p", matrix_D[i][3:0]);
		end
		$display("r: %b", r);

		#1000
		matrix <= '{'{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd0, 12'd0, 12'd0}};
		#1000
		direction = 4'b0010;
		
		#2000
		enable = 1;

		#10000
		enable = 0;

		$display("matrix:");
		for (int i = 3; i > -1; i--) begin
			$display("%p", matrix[i][3:0]);
		end
		$display("\n\ndirection: %b", direction);
		$display("matrix_D:");
		for (int i = 3; i > -1; i--) begin
			$display("%p", matrix_D[i][3:0]);
		end
		$display("r: %b", r);
		
		#2000;
	end

endmodule

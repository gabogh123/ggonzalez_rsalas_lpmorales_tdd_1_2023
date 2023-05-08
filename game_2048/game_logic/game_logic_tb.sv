module game_logic_tb();

    logic 		 clk, rst, enable;
	logic [3:0]  goal;
	logic [3:0]  direction;
	logic [11:0] matrix   [3:0][3:0];
	logic [11:0] matrix_D [3:0][3:0];
	logic [1:0]  wl;

    game_logic uut (clk, rst, enable, goal, direction, matrix, matrix_D, wl);


    initial begin
		$display("Inicia sistema");
		
		clk = 0;
		rst = 0;
		enable = 0;
        goal = 0;
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
        




		
		#300
		matrix = '{'{12'd2, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd4, 12'd0, 12'd0},
				   '{12'd8, 12'd0, 12'd8, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd2}};

		

		

		#100
		rst = 1;
		#40
		rst = 0;
		
	end
	
	initial
	#4000 $finish;

endmodule

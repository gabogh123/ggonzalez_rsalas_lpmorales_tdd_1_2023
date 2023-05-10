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
	
		#20
		matrix = '{'{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd4, 12'd2, 12'd0},
				   '{12'd0, 12'd8, 12'd8, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0}};
		


		#80




		direction = 4'b0001;



		#80



		
		
		#80



		direction = 4'b0100;

		#80;


	end

	initial
	#1000 $finish;
	

endmodule

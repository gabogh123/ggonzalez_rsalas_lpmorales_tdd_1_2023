/*
Movement FSM Test Bench
*/
module movement_fsm_tb();

	logic clk, rst;
	logic [3:0]  direction;
	logic [11:0] moved_matrix [3:0][3:0];

	// movement_fsm fsm_ut (clk, rst, direction, matrix, moved_matrix);
	logic_manager_2 lm (clk, rst, moved_matrix);
	
	initial begin
		$display("Inicia sistema");
		clk = 0;
		
		rst = 0;
		direction = 4'b0000;

	end

	always
		#10 clk = !clk;
		
	initial begin
		#20 rst = 1;
		#10 rst = 0;
		
		#200 
		direction = 4'b1000;
		 
		#100 direction = 4'b0100;
		#300 direction = 4'b0010;
		#20  direction = 4'b0001;

	end
	
	initial
	#1000 $finish;

endmodule

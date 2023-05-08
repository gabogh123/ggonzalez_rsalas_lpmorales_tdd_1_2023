/*
Current State for Summation FSM
*/
module current_state_summation(clk, rst, enable, initial_matrix, D, matrix_D, Q, matrix_Q);

	input  logic 		clk, rst, enable;
	input  logic [11:0] initial_matrix [3:0][3:0];
	input  logic [1:0]  D;
	input  logic [11:0] matrix_D [3:0][3:0];
	output logic [1:0]  Q;
	output logic [11:0] matrix_Q [3:0][3:0];
	
	
	logic [1:0]  regs;
	logic [11:0] regs_matrix [3:0][3:0];
	

	always_ff @ (posedge clk or posedge rst) begin

		//$display("(current_state_summation) D = %b", {D[1], D[0]});

		if (rst) begin
			
			regs = 2'b00;
			regs_matrix = initial_matrix;

		end else if (~enable) begin

			regs = 2'b00;
			regs_matrix = initial_matrix;
		
		end else begin
			
			regs = D;
			regs_matrix = matrix_D;
			
		end

	end
	
	
	assign Q = regs;
	assign matrix_Q = regs_matrix;

endmodule

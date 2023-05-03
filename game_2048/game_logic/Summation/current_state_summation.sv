/*
Current State for Summation FSM
*/
module current_state_summation(clk, rst, D, matrix_D, Q, matrix_Q);

	input  logic clk, rst;
	input  logic [1:0] D;
	input  logic [11:0] matrix_D [3:0][3:0];
	output logic [1:0] Q;
	output logic [11:0] matrix_Q [3:0][3:0];
	

	logic [1:0]  regs;
	logic [11:0] regs_matrix [3:0][3:0];
	

	always_ff @ (posedge clk or posedge rst)
		if (rst) begin
			
			regs = 2'b00;
			regs_matrix = '{ '{12'd0, 12'd0, 12'd0, 12'd0},
								  '{12'd0, 12'd0, 12'd0, 12'd0},
								  '{12'd0, 12'd0, 12'd0, 12'd0},
								  '{12'd0, 12'd0, 12'd0, 12'd0}  
								 };
		
		end else begin
			
			regs = D;
			regs_matrix = matrix_D;
			
		end
	
	
	assign Q = regs;
	assign matrix_Q = regs_matrix;

endmodule

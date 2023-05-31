module current_state (
		input logic clk, rst,
		input logic [2:0] D, // next state
		input logic [11:0] matrix_D [3:0][3:0], // next state matrix
		output logic [2:0] Q, //current state
		output logic [11:0] matrix_Q [3:0][3:0] // current state matrix
	);
	logic [2:0] regs;
	logic [11:0] regs_matrix [3:0][3:0];

	always_ff @( posedge clk) begin : ff_registers
		regs = D;
		regs_matrix = matrix_D;
	end

	assign Q = regs;
	assign matrix_Q = regs_matrix;
	
endmodule
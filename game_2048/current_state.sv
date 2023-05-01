module current_state (
		input logic clk, rst,
		input logic [2:0] D,
		output logic [2:0] Q
	);
	logic [2:0] regs;

	always_ff @( posedge clk or posedge rst ) begin : ff_registers
		if (rst) regs = 3'b000;
		else 
			regs = D;
	end

	assign Q = regs;
	
endmodule
/*
Actual State
*/
module actual_state_movement(input clk, rst, D2, D1, D0, output Q2, Q1, Q0);

logic [2:0] regs;

always_ff @(posedge clk or posedge rst)
	if (rst) regs = 3'b000;
	else
		regs = {D2,D1,D0};

assign {Q2,Q1,Q0} = regs;

endmodule

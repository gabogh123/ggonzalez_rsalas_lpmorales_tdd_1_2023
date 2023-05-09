module greater(
		input logic [11:0] a,b,
		output logic [11:0] c
	);
	logic a_gte_b;
	assign a_gte_b = a >= b;
	assign c = a_gte_b ? a : b;
endmodule

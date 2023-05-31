module outputs_logic(Q, ms);

	input logic [1:0]  Q;
	output ms;

	assign ms = Q[1];

endmodule

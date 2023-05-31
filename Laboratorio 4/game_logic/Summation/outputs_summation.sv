module outputs_summation(Q, ms);

	input logic [1:0]  Q;
	output ms;

	assign ms = Q[0] | Q[1];


endmodule

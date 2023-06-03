module or_bitwise #(parameter N = 8)(
		input logic [N-1:0] a,
		input logic [N-1:0] b,
		output logic [N-1:0] y
	);

	genvar i;
	generate
		for (i = 0; i < N; i++) begin : or_loop
			or_gate or_i(a[i], b[i], y[i]);
		end
	endgenerate
	
endmodule
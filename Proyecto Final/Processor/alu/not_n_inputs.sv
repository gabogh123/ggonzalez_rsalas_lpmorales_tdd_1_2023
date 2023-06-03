module not_n_inputs #(parameter N=8)(
		input logic [N-1:0] a,
		output logic [N-1:0] y
	);
	
	genvar i;
	generate
		for (i = 0; i < N ; i++) begin : not_multiple_inputs
			not_gate not_i(a[i], y[i]);		
		end
	endgenerate
	
endmodule

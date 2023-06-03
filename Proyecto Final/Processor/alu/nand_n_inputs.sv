module nand_n_inputs #(parameter N=8)(
		input logic [N-1:0] a,
		output logic y
	);
	logic [N-2:0] wire_i;
	nand_gate nand_0(a[0], a[1], wire_i[0]);
	genvar i;
	generate
		for (i = 2; i < N; i++) begin : nand_multiple_inputs
			nand_gate nand_i(wire_i[i-2], a[i], wire_i[i-1]);
		end
	endgenerate

	assign y = wire_i[N-2];
	
endmodule

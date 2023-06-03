module shift #(parameter N = 8)(
		input logic [N-1:0] a,
		input logic [N-1:0] shamt,
		input logic d, // 0 >> right / 1 << left
		output logic [N-1:0] y
	);
	
	logic [2**N-1:0][N-1:0] w_a;

	assign w_a[0] = a;

	genvar i;
	generate
		for (i = 1; i < 2**N-1; i++) begin : shift_loop
			shift_1_bit #(N) shift_i(w_a[i-1], d, w_a[i]);
		end
	endgenerate
	
	assign y = w_a[shamt];
	
endmodule

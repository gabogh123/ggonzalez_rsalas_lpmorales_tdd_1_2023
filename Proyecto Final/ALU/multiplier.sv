module multiplier #(parameter N = 8)(
		input logic [N-1:0] a,
		input logic [N-1:0] b,
		output logic [N-1:0] y,
		output logic [3:0] flags //3 = Negative, 2 = Zero, 1 = Carry, 0 = Overflow
	);

	logic [N-1:0][2*N-1:0] partial_products, partial_products_aux, partial_sums;
	logic [N-1:0][3:0] flags_i;
	logic [N-1:0] mult_not;
	genvar i,j,k;

	//first partial product
	generate
		for (k = 0; k < N; k++) begin : first_multiplier
			and_gate and_mult_0(a[k], b[0], partial_products[0][k]);
			and_gate and_sum_0(a[k], b[0], partial_sums[0][k]);
		end
		assign partial_sums[0][N] = 0;
	endgenerate

	// rest of partial products
	generate
		for (i = 1; i < N; i++) begin : multiplier_loop
			for (j = 0; j < N; j++) begin : multiplicand_loop
				and_gate and_mult_i(a[j], b[i], partial_products_aux[i][j]);
			end
			assign partial_products[i] = partial_products_aux[i] << i; //logic left shift
			adder #(N+i) adder_partial_sums(partial_sums[i-1][N+i-1:0], partial_products[i][N+i-1:0], 1'b0, partial_sums[i][N+i-1:0], flags_i[i]);
			assign partial_sums[i][N+i] = flags_i[i][1];
		end	
	endgenerate
	
	assign y = partial_sums[N-1][N-1:0];
	
	//N flag
	assign flags[3] = 1'b0;

	// Z flag
	not_n_inputs #(N) not_mult(y, mult_not);
	and_n_inputs #(N) zero_and(mult_not, flags[2]);

	// C flag
	// or_n_inputs #() carry_flag(y[2*N-1:N], flags[1]);
	assign flags[1] = 1'b0;
	
	// O flag
	assign flags[0] = 1'b0;

	
endmodule

module adder #(parameter N = 8)(
		input logic [N-1:0] a,
		input logic [N-1:0] b,
		input logic c_in,
		output logic [N-1:0] sum,
		output logic [3:0] flags //3 = Negative, 2 = Zero, 1 = Carry, 0 = Overflow
	);

	logic [N-1:0] carry, sum_not;
	logic xor_ab, overflow_0, overflow_1;

	// instantiate full adder for the least significant bit
	full_adder_1_bit fa0(a[0], b[0], c_in, sum[0], carry[0]);
	
	//instantiate remaining full adders for the rest of the bits
	genvar i;
	generate
		for (i=1; i < N; i++) begin : ripple_carry_adder
			full_adder_1_bit fa(a[i], b[i], carry[i-1], sum[i], carry[i]);
		end
	endgenerate

	// Overflow flag
	xor_gate xor_a_b(a[N-1], b[N-1], xor_ab);
	not_gate xnor_a_b(xor_ab, overflow_0);
	xor_gate xor_a_s(a[N-1], sum[N-1], overflow_1);
	and_gate and_ov(overflow_0, overflow_1, flags[0]);

	// Carry flag
	assign flags[1] = carry[N-1];

	// Zero flag
	not_n_inputs #(N) not_sum(sum, sum_not);
	and_n_inputs #(N) zero_and(sum_not, flags[2]);

	// Negative flag
	assign flags[3] = 1'b0;
	
	
endmodule

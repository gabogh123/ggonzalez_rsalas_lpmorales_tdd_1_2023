module subtractor #(parameter N = 8)(
		input logic [N-1:0] a,
		input logic [N-1:0] b,
		output logic [N-1:0] sub, 
		output logic [3:0] flags //3 = Negative, 2 = Zero, 1 = Carry, 0 = Overflow
	);
	
	logic [N-1:0] not_b, sub_not;
	logic c_0, c_1, xor_ab, overflow_0;

	// comparator: check if b greater than a
	is_greater_than #(N) b_gt_a(b, a, flags[3]); // Negative flag

	// compute a minus b (2s' complement)
	not_n_inputs #(N) not_gate_b (b, not_b);
	adder #(N) a_minus_b(a, not_b, 1'b1, sub, c_0);

	// Overflow flag
	xor_gate xor_a_b(a[N-1], b[N-1], xor_ab);
	xor_gate xor_a_s(a[N-1], sub[N-1], overflow_0);
	and_gate and_ov(overflow_0, xor_ab, flags[0]);

	// Carry flag
	assign flags[1] = 1'b0;

	// Zero flag
	not_n_inputs #(N) not_sum(sub, sub_not);
	and_n_inputs #(N) zero_and(sub_not, flags[2]);


endmodule

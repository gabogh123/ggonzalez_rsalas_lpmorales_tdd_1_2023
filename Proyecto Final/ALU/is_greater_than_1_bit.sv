module is_greater_than_1_bit (
		input logic a,b,
		output logic gt
	);
	
	logic wire_0;
	xor_gate xor_ab (a, b, wire_0);
	and_gate and_aw (a, wire_0, gt);

endmodule

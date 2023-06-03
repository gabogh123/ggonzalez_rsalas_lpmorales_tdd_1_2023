// 1 bit full adder
module full_adder_1_bit(
		input logic a,
		input logic b,
		input logic c_in,
		output logic s,
		output logic c_out
	);
	
	logic wire_0, wire_1, wire_2, wire_3, wire_4;
	
	// compute sum bit
	xor_gate xor_ab(a, b, wire_0);
	xor_gate xor_abc(wire_0, c_in, s);
	
	// compute carry out bit
	and_gate and_ab(a, b, wire_1);
	and_gate and_ac(a, c_in, wire_2);
	and_gate and_bc(b, c_in, wire_3);
	
	or_gate or_w1w2(wire_1, wire_2, wire_4);
	or_gate or_w3w4(wire_3, wire_4, c_out);
	
endmodule

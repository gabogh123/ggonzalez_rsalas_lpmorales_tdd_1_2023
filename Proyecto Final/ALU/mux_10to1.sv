module mux_10to1 #(parameter N=8)(
		input logic [N-1:0] sum, sub, multi, div, mod, and_, or_, xor_, shift_l, shift_r,
		input logic [3:0] sel,
		output logic [N-1:0] y
	);

	logic [N-1:0] wire_00, wire_01, wire_02, wire_03, wire_04, wire_10, wire_11, wire_2;

	mux_2to1 #(N) mux_00 (sum, sub, sel[0], wire_00);
	mux_2to1 #(N) mux_01 (multi, div, sel[0], wire_01);
	mux_2to1 #(N) mux_02 (mod, and_, sel[0], wire_02);
	mux_2to1 #(N) mux_03 (or_, xor_, sel[0], wire_03);
	mux_2to1 #(N) mux_04 (shift_l, shift_r, sel[0], wire_04);

	mux_2to1 #(N) mux_10 (wire_00, wire_01, sel[1], wire_10);
	mux_2to1 #(N) mux_11 (wire_02, wire_03, sel[1], wire_11);

	mux_2to1 #(N) mux_2 (wire_10, wire_11, sel[2], wire_2);
	
	mux_2to1 #(N) mux_3 (wire_2, wire_04, sel[3], y);

endmodule

module alu #(parameter N = 4)(
		input logic [N-1:0] a,
		input logic [N-1:0] b,
		input logic uc_up,
		input logic uc_reset,
		output logic [3:0] sel, // 0 = sum, 1 = sub, 2 = mult, 3 = div, 4 = mod, 5 = and, 6 = or, 7 = xor, 8 = shift l, 9 = shift r
		output logic [N-1:0] y,
		output logic [0:6] y_disp,
		output logic [0:6] sel_disp,
		output logic [3:0] flags //3 = Negative, 2 = Zero, 1 = Carry, 0 = Overflow
	);
	
	logic [N-1:0] y_adder, y_subtractor, y_mult, y_div, y_mod, y_and, y_or, y_xor, y_shift_l, y_shift_r;
	logic [3:0] f_adder, f_subtractor, f_mult, f_div_mod, f_and, f_or, f_xor, f_shift_l, f_shift_r; // flags
	
	counter_up #(N) uc_counter_up(uc_up, uc_reset, 4'b0000, 4'b1001, sel);
	
	adder #(N) alu_adder(a, b, 1'b0, y_adder, f_adder);
	subtractor #(N) alu_subtractor(a, b, y_subtractor, f_subtractor);
	multiplier #(N) alu_multiplier(a, b, y_mult, f_mult);
	divider #(N) alu_divider(a, b, y_div, y_mod, f_div_mod);
	and_bitwise #(N) alu_and(a, b, y_and);
	or_bitwise #(N) alu_or(a, b, y_or);
	xor_bitwise #(N) alu_xor(a, b, y_xor);
	shift #(N) shift_left(a, b, 1'b1, y_shift_l);
	shift #(N) shift_right(a, b, 1'b0, y_shift_r);
	
	mux_10to1 #(N) alu_y_mux(y_adder, y_subtractor, y_mult, y_div, y_mod, y_and, y_or, y_xor, y_shift_l, y_shift_r, sel, y);
	mux_10to1 #(4) alu_f_mux(f_adder, f_subtractor, 0, 0, 0, 0, 0, 0, 0, 0, sel, flags);

	seven_seg_decoder display_result(y, y_disp);
	seven_seg_decoder display_sel(sel, sel_disp);
	
endmodule

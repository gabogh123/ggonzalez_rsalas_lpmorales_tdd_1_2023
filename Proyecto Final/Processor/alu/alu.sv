/*

ALU
created by: Luis Pedro

Operaciones:			|			Flags:
0. 0000 = sum			|			0001: Overflow
1. 0001 = sub			|			0010: Carry
2. 0010 = mult			|			0100: Zero
3. 0011 = div *			|			1000: Negative
4. 0100 = mod *			|
5. 0101 = and			|
6. 0110 = or			|
7. 0111 = xor			|
8. 1000 = shift l *		|
9. 1001 = shift r *		|

*/
module alu
    #  (parameter N = 32)
       (A, B, func, Y, flags);

    input  logic [N-1:0]     A;
	input  logic [N-1:0]     B;
	input  logic   [3:0]  func;
	output logic [N-1:0]     Y;
	output logic   [3:0] flags;
	
	// Results
	logic [N-1:0] y_adder, y_subtractor, y_mult, y_div, y_mod, y_and, y_or, y_xor, y_shift_l, y_shift_r;
	
	// Flags
	logic [3:0] f_adder, f_subtractor, f_mult, f_div_mod, f_and, f_or, f_xor, f_shift_l, f_shift_r;
	
	adder 	    #(N) alu_adder		(A, B, 1'b0, y_adder, f_adder);
	subtractor  #(N) alu_subtractor (A, B, y_subtractor, f_subtractor);
	multiplier  #(N) alu_multiplier (A, B, y_mult, f_mult);
	//divider     #(N) alu_divider	(A, B, y_div, y_mod, f_div_mod);
	and_bitwise #(N) alu_and		(A, B, y_and);
	or_bitwise  #(N) alu_or			(A, B, y_or);
	xor_bitwise #(N) alu_xor		(A, B, y_xor);
	shift 		#(N) shift_left		(A, B, 1'b1, y_shift_l);
	shift 		#(N) shift_right	(A, B, 1'b0, y_shift_r);
	
	mux_10to1   #(N) alu_y_mux 		(y_adder, y_subtractor, y_mult, y_div, y_mod, y_and, y_or, y_xor, y_shift_l, y_shift_r, func, Y);
	mux_10to1   #(4) alu_f_mux 		(f_adder, f_subtractor, 0, 0, 0, 0, 0, 0, 0, 0, func, flags);

endmodule

/*

ALU

// |-----------------------|
// | SW1 | SW0 | PB3 | PB2 |
// |-----------------------|
//	|	0	|	0	|	0	|	0	| -> suma
//	|	0	|	0	|	0	|	1	| -> resta
//	|	0	|	0	|	1	|	0	| -> 	 x
//	|	0	|	0	|	1	|	1	| -> 	 x
// |-----------------------|
//	|	0	|	1	|	0	|	0	| -> multiplicacion
//	|	0	|	1	|	0	|	1	| -> division
//	|	0	|	1	|	1	|	0	| -> modulo
//	|	0	|	1	|	1	|	1	| -> 	 x
// |-----------------------|
//	|	1	|	0	|	0	|	0	| -> and
//	|	1	|	0	|	0	|	1	| -> or
//	|	1	|	0	|	1	|	0	| -> xor
//	|	1	|	0	|	1	|	1	| -> 	 x
// |-----------------------|
//	|	1	|	1	|	0	|	0	| -> shift L
//	|	1	|	1	|	0	|	1	| -> shift R
//	|	1	|	1	|	1	|	0	| -> 	 x
//	|	1	|	1	|	1	|	1	| -> 	 x
// |-----------------------|

*/

module ALU_param 
	# (parameter M = 4)
	  (A, B, F, R, C, N, V, Z);
	
	input  [M-1:0] 	A; // Operand
	input  [M-1:0] 	B; // Operand
	input  [3:0]	   F; // Operation
	
	output [M-1:0]	   R; // Result
	output				C; // Carry
	output				N; // Negative
	output				V; // Overflow
	output				Z; // Zero
	
	// Variables para Result
	logic [M-1:0] R_suma;
	logic [M-1:0] R_resta;
	
	logic [M-1:0] R_multiplicacion;
	logic [M-1:0] R_division;
	logic [M-1:0] R_modulo;
	
	logic [M-1:0] R_and;
	logic [M-1:0] R_or;
	logic [M-1:0] R_xor;
	
	logic [M-1:0] R_shiftr;
	logic [M-1:0] R_shiftl;
	
	// Variables para Carry
	logic 		  C_suma;
	logic 		  C_resta; // X
	
	logic 		  C_multiplicacion;
	logic 		  C_division; // X
	logic 		  C_modulo; // X
	
	logic 		  C_and; // X
	logic 		  C_or; // X
	logic 		  C_xor; // X
	 
	logic 		  C_shiftr; // X
	logic 		  C_shiftl; // X
	
	// Variables para Negative
	logic 		  N_suma;
	logic 		  N_resta;
	
	logic 		  N_multiplicacion;
	logic 		  N_division;
	logic 		  N_modulo; // X
	
	logic 		  N_and; // X
	logic 		  N_or; // X
	logic 		  N_xor; // X
	
	logic 		  N_shiftr; // X
	logic 		  N_shiftl; // X
	
	// Variables para Overflow
	logic 		  V_suma; // X
	logic 		  V_resta; // X
	
	logic 		  V_multiplicacion;
	logic 		  V_division; // X
	logic 		  V_modulo; // X
	
	logic 		  V_and; // X
	logic 		  V_or; // X
	logic 		  V_xor; // X
	
	logic 		  V_shiftr;
	logic 		  V_shiftl;
	
	// Variables para Zero
	logic 		  Z_suma;
	logic 		  Z_resta;
	
	logic 		  Z_multiplicacion;
	logic 		  Z_division;
	logic 		  Z_modulo;
	
	logic 		  Z_and;
	logic 		  Z_or;
	logic 		  Z_xor;
	
	logic 		  Z_shiftr;
	logic 		  Z_shiftl;
	
	
	// Intanciacion de los modulos de las operaciones
	suma   # (.M(M)) suma_funcion 			 (.A(A), .B(B), .R(R_suma), .C(C_suma), .N(N_suma), .V(V_suma), .Z(Z_suma));
	resta  # (.M(M)) resta_funcion 			 (.A(A), .B(B), .R(R_resta), .C(C_resta), .N(N_resta), .V(V_resta), .Z(Z_resta));
	
	mult   # (.M(M)) multiplicacion_funcion (.A(A), .B(B), .R(R_multiplicacion), .C(C_multiplicacion), .N(N_multiplicacion), .V(V_multiplicacion), .Z(Z_multiplicacion));
	div    # (.M(M)) division_funcion		 (.A(A), .B(B), .R(R_division), .C(C_division), .N(N_division), .V(V_division), .Z(Z_division));
	modulo # (.M(M)) modulo_funcion 			 (.A(A), .B(B), .R(R_modulo), .C(C_modulo), .N(N_modulo), .V(V_modulo), .Z(Z_modulo));
	
	and_f  # (.M(M)) and_funcion 				 (.A(A), .B(B), .R(R_and), .C(C_and), .N(N_and), .V(V_and), .Z(Z_and));
	or_f   # (.M(M)) or_funcion 				 (.A(A), .B(B), .R(R_or), .C(C_or), .N(N_or), .V(V_or), .Z(Z_or));
	xor_f  # (.M(M)) xor_funcion 				 (.A(A), .B(B), .R(R_xor), .C(C_xor), .N(N_xor), .V(V_xor), .Z(Z_xor));
	
	shiftr # (.M(M)) shiftr_funcion 			 (.A(A), .R(R_shiftr), .C(C_shiftr), .N(N_shiftr), .V(V_shiftr), .Z(Z_shiftr));
	shiftl # (.M(M)) shiftl_funcion 			 (.A(A), .R(R_shiftl), .C(C_shiftl), .N(N_shiftl), .V(V_shiftl), .Z(Z_shiftl));
	
	
	// Variables para MUX de Result
	logic [M-1:0] R_mux_aritmetico1;
	logic [M-1:0] R_mux_aritmetico2;
	logic [M-1:0] R_mux_logico;
	logic [M-1:0] R_mux_shift;
	
	// Mux para los Results
	mux_4NtoN # (.M(M)) mux_aritmetico1_result (R_suma, R_resta, 4'b1111, 4'b1111, ~F[1:0], R_mux_aritmetico1);
	mux_4NtoN # (.M(M)) mux_aritmetico2_result (R_multiplicacion, R_division, R_modulo, 4'b1111, ~F[1:0], R_mux_aritmetico2);
	mux_4NtoN # (.M(M)) mux_logico_result 		 (R_and, R_or, R_xor, 4'b1111, ~F[1:0], R_mux_logico);
	mux_4NtoN # (.M(M)) mux_shift_result 		 (R_shiftr, R_shiftl, 4'b1111, 4'b1111, ~F[1:0], R_mux_shift);
	
	// Mux para el Result
	mux_4NtoN # (.M(M)) mux_result (R_mux_aritmetico1, 
											  R_mux_aritmetico2, 
											  R_mux_logico, 
											  R_mux_shift,
											  F[3:2], R);
											  
											  
	// Variables para MUX de Carry
	logic			  C_mux_aritmetico1;
	logic			  C_mux_aritmetico2;
	logic			  C_mux_logico;
	logic			  C_mux_shift;
								  
	// Mux para los Carries
	mux_4NtoN # (.M(1)) mux_aritmetico1_carry (C_suma, C_resta, 1'b0, 1'b0, ~F[1:0], C_mux_aritmetico1);
	mux_4NtoN # (.M(1)) mux_aritmetico2_carry (C_multiplicacion, C_division, C_modulo, 1'b0, ~F[1:0], C_mux_aritmetico2);
	mux_4NtoN # (.M(1)) mux_logic_carry (C_and, C_or, C_xor, 1'b0, ~F[1:0], C_mux_logico);
	mux_4NtoN # (.M(1)) mux_shift_carry (C_shiftr, C_shiftl, 1'b0, 1'b0, ~F[1:0], C_mux_shift);
	
	// Mux para el Carry
	mux_4NtoN # (.M(1)) mux_carry (C_mux_aritmetico1,
											 C_mux_aritmetico2,
											 C_mux_logico,
											 C_mux_shift,
											 F[3:2], C);
									  
	
	// Variables para MUX de Negative
	logic			  N_mux_aritmetico1;
	logic			  N_mux_aritmetico2;
	logic			  N_mux_logico;
	logic			  N_mux_shift;
	
	// Mux para los Negatives
	mux_4NtoN # (.M(1)) mux_aritmetico1_negative (N_suma, N_resta, 1'b0, 1'b0, ~F[1:0], N_mux_aritmetico1);
	mux_4NtoN # (.M(1)) mux_aritmetico2_negative (N_multiplicacion, N_division, N_modulo, 1'b0, ~F[1:0], N_mux_aritmetico2);
	mux_4NtoN # (.M(1)) mux_logic_negative (N_and, N_or, N_xor, 1'b0, ~F[1:0], N_mux_logico);
	mux_4NtoN # (.M(1)) mux_shift_negative (N_shiftr, N_shiftl, 1'b0, 1'b0, ~F[1:0], N_mux_shift);
	
	// Mux para el Negative
	mux_4NtoN # (.M(1)) mux_negative (N_mux_aritmetico1,
												 N_mux_aritmetico2,
												 N_mux_logico,
												 N_mux_shift,
												 F[3:2], N);
	
	
	// Variables para MUX de Overflow
	logic			  V_mux_aritmetico1;
	logic			  V_mux_aritmetico2;
	logic			  V_mux_logico;
	logic			  V_mux_shift;
	
	// Mux para los Overflows
	mux_4NtoN # (.M(1)) mux_aritmetico1_overflow (V_suma, V_resta, 1'b0, 1'b0, ~F[1:0], V_mux_aritmetico1);
	mux_4NtoN # (.M(1)) mux_aritmetico2_overflow (V_multiplicacion, V_division, V_modulo, 1'b0, ~F[1:0], V_mux_aritmetico2);
	mux_4NtoN # (.M(1)) mux_logic_overflow (V_and, V_or, V_xor, 1'b0, ~F[1:0], V_mux_logico);
	mux_4NtoN # (.M(1)) mux_shift_overflow (V_shiftr, V_shiftl, 1'b0, 1'b0, ~F[1:0], V_mux_shift);
	
	// Mux para el Overflow
	mux_4NtoN # (.M(1)) mux_overflow (V_mux_aritmetico1,
												 V_mux_aritmetico2,
												 V_mux_logico,
												 V_mux_shift,
												 F[3:2], V);
	
	
	// Variables para MUX de Zero
	logic			  Z_mux_aritmetico1;
	logic			  Z_mux_aritmetico2;
	logic			  Z_mux_logico;
	logic			  Z_mux_shift;
	
	// Mux para los Zeros
	mux_4NtoN # (.M(1)) mux_aritmetico1_zero (Z_suma, Z_resta, 1'b0, 1'b0, ~F[1:0], Z_mux_aritmetico1);
	mux_4NtoN # (.M(1)) mux_aritmetico2_zero (Z_multiplicacion, Z_division, Z_modulo, 1'b0, ~F[1:0], Z_mux_aritmetico2);
	mux_4NtoN # (.M(1)) mux_logic_zero (Z_and, Z_or, Z_xor, 1'b0, ~F[1:0], Z_mux_logico);
	mux_4NtoN # (.M(1)) mux_shift_zero (Z_shiftr, Z_shiftl,  1'b0, 1'b0, ~F[1:0], Z_mux_shift);
	
	// Mux para el Zero
	mux_4NtoN # (.M(1)) mux_zero (Z_mux_aritmetico1,
											Z_mux_aritmetico2,
											Z_mux_logico,
											Z_mux_shift,
											F[3:2], Z);
	
endmodule

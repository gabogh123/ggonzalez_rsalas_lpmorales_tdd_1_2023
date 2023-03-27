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
	
	// Variables para los resultados
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
	
	//assign R_suma = 4'b0000;
	//assign R_resta = 4'b0001;
	
	//assign R_multiplicacion = 4'b0100;
	//assign R_division = 4'b0101;
	//assign R_modulo = 4'b0110;
	
	//assign R_and = 4'b1000;
	//assign R_or = 4'b1001;
	//assign R_xor = 4'b1010;
	
	//assign R_shiftr = 4'b1100;
	//assign R_shiftl = 4'b1101;
	
	
	// Intanciacion de los modulos de las operaciones
	suma   # (.M(M)) suma_funcion 			 (.A(A), .B(B), .R(R_suma));
	resta  # (.M(M)) resta_funcion 			 (.A(A), .B(B), .R(R_resta));
	
	mult   # (.M(M)) multiplicacion_funcion (.A(A), .B(B), .R(R_multiplicacion));
	div    # (.M(M)) division_funcion		 (.A(A), .B(B), .R(R_division));
	modulo # (.M(M)) modulo_funcion 			 (.A(A), .B(B), .R(R_modulo));
	
	and_f  # (.M(M)) and_funcion 				 (.A(A), .B(B), .R(R_and));
	or_f   # (.M(M)) or_funcion 				 (.A(A), .B(B), .R(R_or));
	xor_f  # (.M(M)) xor_funcion 				 (.A(A), .B(B), .R(R_xor));
	
	shiftr # (.M(M)) shiftr_funcion 			 (.A(A), .R(R_shiftr));
	shiftl # (.M(M)) shiftl_funcion 			 (.A(A), .R(R_shiftl));
	
	
	// Variables para los resultados de las operaciones
	logic [M-1:0] R_mux_aritmetico1;
	logic [M-1:0] R_mux_aritmetico2;
	logic [M-1:0] R_mux_logico;
	logic [M-1:0] R_mux_shift;
	
	
	// Mux para los Results
	mux_4NtoN # (.M(M)) mux_aritmetico1 (R_suma, R_resta, 4'b1111, 4'b1111, F[1:0], R_mux_aritmetico1);
	mux_4NtoN # (.M(M)) mux_aritmetico2 (R_multiplicacion, R_division, R_modulo, 4'b1111, F[1:0], R_mux_aritmetico2);
	mux_4NtoN # (.M(M)) mux_logico (R_and, R_or, R_xor, 4'b1111, F[1:0], R_mux_logico);
	mux_4NtoN # (.M(M)) mux_shift (R_shiftr, R_shiftl, 4'b1111, 4'b1111, F[1:0], R_mux_shift);
	
	// Mux para el Result
	mux_4NtoN # (.M(M)) mux_result (R_mux_aritmetico1,
											  R_mux_aritmetico2, 
											  R_mux_logico, 
											  R_mux_shift,
											  F[3:2], R);
	
	
	// mux respectivos para el desbordamiento, acarreo, cero y negativo 
	
	// .
	// .
	// .
	
endmodule

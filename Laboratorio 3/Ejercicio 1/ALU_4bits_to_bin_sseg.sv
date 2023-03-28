module ALU_4bits_to_bin_sseg
	# (parameter M = 4)
	  (A, B, F, /*R,*/ C, N, V, Z,
	   sseg_hex3, sseg_hex2, sseg_hex1, sseg_hex0);
	  
	input  [M-1:0] 	A; // Operand
	input  [M-1:0] 	B; // Operand
	input  [3:0]	   F; // Operation
	
	output				C; // Carry
	output				N; // Negative
	output				V; // Overflow
	output				Z; // Zero
	
	output [6:0] 		sseg_hex3;
	output [6:0] 		sseg_hex2;
	output [6:0] 		sseg_hex1;
	output [6:0] 		sseg_hex0;
	
	logic [M-1:0] R;
	
	// Instancia de la ALU
	ALU_param # (.M(M)) alu (A, B, F, R, C, N, V, Z);
	
	// Instancia del convertidor hex a sseg del 7 signal display HEX3
	hex_to_sseg hex_to_sseg_hex3 ({3'b000, R[3]}, sseg_hex3);
	
	// Instancia del convertidor hex a sseg del 7 signal display HEX2
	hex_to_sseg hex_to_sseg_hex2 ({3'b000, R[2]}, sseg_hex2);
	
	// Instancia del convertidor hex a sseg del 7 signal display HEX1
	hex_to_sseg hex_to_sseg_hex1 ({3'b000, R[1]}, sseg_hex1);
	
	// Instancia del convertidor hex a sseg del 7 signal display HEX0
	hex_to_sseg hex_to_sseg_hex0 ({3'b000, R[0]}, sseg_hex0);
	
endmodule

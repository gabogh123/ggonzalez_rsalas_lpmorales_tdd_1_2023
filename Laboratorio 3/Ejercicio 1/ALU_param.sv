module ALU_param 
			# (parameter BITS = 4) // Se define un valor para el parametro pero este puede cambiar al compilar
			  (A, B, O, Y, C, N, V, Z);

	
	input 	[BITS-1:0] 	A;
	input 	[BITS-1:0] 	B;
	input 	[3:0]	 	   O; //Operation
									// Se podrían usar los 2 switches que faltan como bits mas significativos para
									// escoger la operacion. (SW1 y SW0)
									// Los otros dos bits menos significativos podríamos usar dos push buttons grandes.
									// (PB3 y PB2)
									//
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
									//
									// Para que esto se cumpla creo que deberiamos usar varios MUX para hacerlo con
									// un modelo de estructura
	
	output	[BITS-1:0]	Y; //Result
	output					C; //Carry
	output					N; //Negative
	output					V; //Overflow
	output					Z; //Zero
	
	
	// Mux para la respuesta
	
	// mux_16to4
	// mux_16to4
	// mux_16to4
	// mux_16to4
	
	// mux_16to4
	
	

	// mux respectivos para el desbordamiento, acarreo, cero y negativo 
	
	// .
	// .
	// .
	
endmodule

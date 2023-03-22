module ALU
			# (parameter BITS = 4)
			(Y, C, V, N, Z, A, B, Op);

	output	[BITS:0]	Y; //Result
	output				C; //Carry
	output				N; //Negative
	output				V; //Overflow
	output				Z; //Zero
	input		[BITS:0]	A;
	input		[BITS:0]	B;
	input		[3:0]		Op; //Operation -> Hay que definir bien como y que botones vamos a usar para las operaciones
	
	wire		[BITS:0]	AS, And, Or, Xor, Not;
	wire					s;
	wire					Vas;
	wire					Cas;
	
	// Operations
	
	
	andOp aluand(And, A, B);
	orOp aluor(Or, A, B);
	xorOp aluxor(Xor, A, B);

	
	
	nor(s, Op[1], Op[2]);   // s == 0 => a logical operation, otherwise and arithmetic operation.
   and(C, Cas, s);
   and(V, Vas, s);
   and(N, Y[BITS-1], s);       // Most significant bit is the sign bit in 2's complement.   
   zero z(Z, Y);           // All operations can set the Zero status bit.
	
endmodule // alu
	
	
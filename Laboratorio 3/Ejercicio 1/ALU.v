module ALU(Y, C, V, N, Z, A, B, Op);

	output	[15:0]	Y; //Result
	output				C; //Carry
	output				N; //Negative
	output				V; //Overflow
	output				Z; //Zero
	input		[15:0]	A;
	input		[15:0]	B;
	input		[2:0]		Op; //Operation
	
	wire		[15:0]	AS, And, Or, Xor, Not;
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
   and(N, Y[15], s);       // Most significant bit is the sign bit in 2's complement.   
   zero z(Z, Y);           // All operations can set the Zero status bit.
	
endmodule // alu
	
	
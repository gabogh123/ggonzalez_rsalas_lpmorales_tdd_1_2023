module andOp(Y, A, B);

	output[15:0] Y; //Salida 
	input [15:0] A; //Entradas
	input [15:0] B;
	
	and(Y[0], A[0], B[0]);
	and(Y[1], A[1], B[1]);
	and(Y[2], A[2], B[2]);
	and(Y[3], A[3], B[3]);
	and(Y[4], A[4], B[4]);
	and(Y[5], A[5], B[5]);
	and(Y[6], A[6], B[6]);
	and(Y[7], A[7], B[7]);
	and(Y[8], A[8], B[8]);
	and(Y[9], A[9], B[9]);
	and(Y[10], A[10], B[10]);
	and(Y[11], A[11], B[11]);
	and(Y[12], A[12], B[12]);
	and(Y[13], A[13], B[13]);
	and(Y[14], A[14], B[14]);
	and(Y[15], A[15], B[15]);

	
	
endmodule
module zero(Z, A);
   output Z;        // Result. 
   input [15:0]  A; // Operand.

   wire [15:0] 	 Y; // Temp result.
   
   xnor(Y[0], A[0], 0);
   xnor(Y[1], A[1], 0);
   xnor(Y[2], A[2], 0);
   xnor(Y[3], A[3], 0);
   xnor(Y[4], A[4], 0);
   xnor(Y[5], A[5], 0);
   xnor(Y[6], A[6], 0);
   xnor(Y[7], A[7], 0);
   xnor(Y[8], A[8], 0);
   xnor(Y[9], A[9], 0);
   xnor(Y[10], A[10], 0);
   xnor(Y[11], A[11], 0);
   xnor(Y[12], A[12], 0);
   xnor(Y[13], A[13], 0);
   xnor(Y[14], A[14], 0);
   xnor(Y[15], A[15], 0);
   and(Z, Y[0], Y[1], Y[2], Y[3], Y[4],
       Y[5], Y[6], Y[7], Y[8],
       Y[9], Y[10], Y[11], Y[12],
       Y[13], Y[14], Y[15]);
endmodule 
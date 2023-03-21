module xorOp(Y, A, B);
   output [15:0] Y; // Result.
   input [15:0]  A; // Operand.
   input [15:0]  B; // Operand.

   xor(Y[0], A[0], B[0]);
   xor(Y[1], A[1], B[1]);
   xor(Y[2], A[2], B[2]);
   xor(Y[3], A[3], B[3]);
   xor(Y[4], A[4], B[4]);
   xor(Y[5], A[5], B[5]);
   xor(Y[6], A[6], B[6]);
   xor(Y[7], A[7], B[7]);
   xor(Y[8], A[8], B[8]);
   xor(Y[9], A[9], B[9]);
   xor(Y[10], A[10], B[10]);
   xor(Y[11], A[11], B[11]);
   xor(Y[12], A[12], B[12]);
   xor(Y[13], A[13], B[13]);
   xor(Y[14], A[14], B[14]);
   xor(Y[15], A[15], B[15]);
endmodule // xorop
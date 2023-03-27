module suma
	#(parameter M = 4)
	 (A, B, R);
 
	 input  [M-1:0] A;
	 input  [M-1:0] B;
	
	 output [M-1:0] R;
	
    wire [M-1:0] carry;
    wire carry_out;
    genvar i;
 
    generate
	 
      for (i = 0; i < M; i = i + 1) begin: generate_suma
        if (i == 0) 
          half_adder ha (A[0], B[0], R[0], carry[0]);
        else 
          full_adder fa (A[i], B[i], carry[i-1], R[i], carry[i]);
      end  
 
      assign carry_out = carry[M-1];
		  
    endgenerate
	 
endmodule

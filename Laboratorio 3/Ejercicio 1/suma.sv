module suma
	# (parameter M = 4)
	  (A, B, R, C, N, V, Z);
  
	input  logic [M-1:0] A;
	input  logic [M-1:0] B;
	
	output logic [M-1:0] R;
	output				   C;
	output					N;
	output					V;
	output					Z;
	
    wire [M-1:0] carry;
    genvar i;
 
    generate
	 
      for (i = 0; i < M; i = i + 1) begin: generate_suma
		
        if (i == 0) 
          half_adder ha (A[0], B[0], R[0], carry[0]);
        else 
          full_adder fa (A[i], B[i], carry[i-1], R[i], carry[i]);
			 
      end
 
      assign C = carry[M-1];
		
		assign Z = ~(R || '0) && ~C;
		  
    endgenerate
	 
endmodule

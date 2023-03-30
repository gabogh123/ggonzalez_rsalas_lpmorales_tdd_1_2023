module div
	# (parameter M = 4)
	  (A, B, R, C, N, V, Z);
  
	input  logic [M-1:0] A;
	input  logic [M-1:0] B;
	
	output logic [M-1:0] R; // Cociente
	output				   C;
	output					N;
	output					V;
	output					Z;
	
	wire [M-1:0] remainder;
	 
	genvar i, j;
	
	generate
	
		for (i = 0; i < $size(A); i++) begin : generate_divider_1

			wire [M-1:0] minuendo;
	
			//for (j = 0; j < $size(B); j++) begin : generate_divider_2
			
				
				assign R[i] = A[i] ^ B[i];

			
			//end
	
		end
	
	endgenerate

endmodule

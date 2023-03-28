module resta
	# (parameter M = 4)
	  (A, B, R, C, N, V, Z);
  
	input  logic [M-1:0] A;
	input  logic [M-1:0] B;
	
	output logic [M-1:0] R;
	output				   C;
	output					N;
	output					V;
	output					Z;
	 

	wire [M-1:0] A_comp;
	wire [M-1:0] B_comp;
	wire [M:0] carry;

	assign A_comp = ~A;
	assign B_comp = ~B;

	assign carry[0] = 1'b1;

	genvar i;
	generate
		 for (i = 0; i < M; i++) begin : subtractor
			  assign carry[i+1] = ((A_comp[i] & carry[i]) | (B[i] & carry[i]) | (A_comp[i] & B[i]));
			  assign R[i] = (A_comp[i] ^ B[i] ^ carry[i]);
		 end
	endgenerate

endmodule	 
	 

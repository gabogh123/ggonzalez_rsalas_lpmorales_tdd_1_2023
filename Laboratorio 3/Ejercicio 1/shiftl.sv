module shiftl
	# (parameter M = 4)
	  (A, B, R, C, N, V, Z);
  
	input  logic [M-1:0] A;
	input  logic [M-1:0] B;
	
	output logic [M-1:0] R;
	output				   C;
	output					N;
	output					V;
	output					Z;
			
		
		
			
	assign R = A <<< 1; // lol
	
	
	
		
endmodule
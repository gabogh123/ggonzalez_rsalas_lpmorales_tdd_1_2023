module shiftl
	# (parameter M = 4)
	  (A, R, C, N, V, Z);
  
	input  logic [M-1:0] A;
	
	output logic [M-1:0] R;
	output				   C;
	output					N;
	output					V;
	output					Z;
			
		
		
			
	assign R = A <<< 1; // lol
	
	
	
		
endmodule
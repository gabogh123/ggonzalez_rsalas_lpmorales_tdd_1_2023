module shiftl
	# (parameter M = 4)
	  (A, R);
	
	input  logic [M-1:0] A;
	
	output logic [M-1:0] R;
			
		
		
			
	assign R = A <<< 1; // lol
	
	
	
		
endmodule
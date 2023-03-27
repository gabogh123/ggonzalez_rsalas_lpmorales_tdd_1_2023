module shiftr
	# (parameter M = 4)
	  (A, R);
	
	input  [M-1:0] A;
	
	output [M-1:0] R;
	
	
			
			
	assign R = A >>> 1; // lol
	
	
		
		
endmodule
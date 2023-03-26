module shiftr
			# (parameter BITS = 4)
			  (A, B, Y);
	
	input [BITS-1:0] A;
	input [BITS-1:0] B;
	
	output [BITS-1:0] Y;
			
			
		assign Y = A >>> 1;
		
endmodule
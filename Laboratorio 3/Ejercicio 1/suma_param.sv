module suma_param 
			# (parameter BITS = 4)
			  (A, B, S);
			  
	input 	[BITS-1:0] 	A;
	input 	[BITS-1:0] 	B;
	
	output   [BITS-1:0] 	S;
	
	
	assign S = A  B; // Obvio hay que corregir, es por el ejemplo
	
endmodule

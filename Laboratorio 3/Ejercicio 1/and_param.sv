module and_param 
			# (parameter BITS = 4)
			  (A, B, Y);
	
	input [BITS-1:0] A;
	input [BITS-1:0] B;
	
	output [BITS-1:0] Y;
	
	always @(A, B, Y)
	
		begin
		
			for (int i = 0; i < $size(A); i++)
			
					Y[i] = A[i] && B[i];
			
		end
		
endmodule
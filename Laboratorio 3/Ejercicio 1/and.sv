module and_param 
			# (parameter BITS = 4)
			  (A, B, Y);
	
	input [BITS-1:0] A;
	input [BITS-1:0] B;
	
	output [BITS-1:0] Y;
	
		initial begin
		
			for (int i = 0; i < $size(A); i++) begin
			
					Y[i] = A[i] && B[i];
			end
		end
		
endmodule
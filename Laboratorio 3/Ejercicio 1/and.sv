module and_f
			# (parameter M = 4)
			  (A, B, Y);
	
	input [M-1:0] A;
	input [M-1:0] B;
	
	output [M-1:0] Y;
	
		initial begin
		
			for (int i = 0; i < $size(A); i++) begin
			
					Y[i] = A[i] && B[i];
			end
		end
		
endmodule
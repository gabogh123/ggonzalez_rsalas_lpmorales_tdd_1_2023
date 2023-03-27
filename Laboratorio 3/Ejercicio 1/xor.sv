module xor_f
	# (parameter M = 4)
	  (A, B, R);
	
	input  [M-1:0] A;
	input  [M-1:0] B;
	
	output [M-1:0] R;
	
	always @ (A or B) begin
	
		for (int i = 0; i < $size(A); i++) begin
		
				R[i] = A[i] ^ B[i];
		end
		
	end
		
endmodule
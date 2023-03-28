module or_f 
	# (parameter M = 4)
	  (A, B, R);
	
	input  logic [M-1:0] A;
	input  logic [M-1:0] B;
	
	output logic [M-1:0] R;
	
	always @ (A or B) begin
	
		for (int i = 0; i < $size(A); i++) begin
		
				R[i] = A[i] || B[i];
		end
		
	end
		
endmodule

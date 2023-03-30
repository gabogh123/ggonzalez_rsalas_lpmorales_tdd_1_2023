module shiftl
	# (parameter M = 4)
	  (A, B, R, C, N, V, Z);
  
	input  logic [M-1:0] A; // shiftee
	input  logic [M-1:0] B; // shift amount 0001
	
	output logic [M-1:0] R;
	output				   C;
	output					N;
	output					V;
	output					Z;
				
	// assign R = A <<< 1; // lol
	
	genvar i;
	
	generate
	
		reg  [M-1:0] s0, sn;
	
		for (i = 0; 2**i <= $size(B) + 1; i++) begin : generate_shiftl
	
		wire [(2**i)-1:0] si = '0;
		
			if ((2**(i+1)) > $size(B) + 1) begin
			
				mux_2NtoN # (.M(M)) m2NtoN_Sm (sn, si, B[i], R);
				
				mux_2NtoN # (.M(1)) m2NtoN_V (0, 1, B[i], V);
				
			end else if (i == 0) begin
			
				mux_2NtoN # (.M(M)) m2NtoN_S0 (A, {A[(M-1)-(2**i):0], 1'b0}, B[i], s0);
				
				//assign sy = s0;
			
			end else begin
			
				mux_2NtoN # (.M(M)) m2NtoN_Si (s0, {s0[(M-1)-(2**i):0], si}, B[i], sn);
				
				//assign sy = sn;
			
			end
		
		end
		
		assign Z = ~(R || '0);
	
	endgenerate
		
endmodule

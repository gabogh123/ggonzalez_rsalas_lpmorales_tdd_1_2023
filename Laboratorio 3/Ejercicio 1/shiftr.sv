module shiftr
	# (parameter M = 4)
	  (A, B, R, C, N, V, Z);
  
	input  logic [M-1:0] A; // shiftee
	input  logic [M-1:0] B; // shift amount
 	
	output logic [M-1:0] R;
	output				   C;
	output					N;
	output					V;
	output					Z;
		
	// assign R = A >>> 1; // lol
	
	// logic [M-1:0] s0, sy, sn;
	
	// assign sx = 4'b0000;
	
	// mux_2NtoN # (.M(M)) m2NtoN_S1 (A, {1'b0, A[M-1:1]}, B[0], sx);
	
	// assign sy = '0;
	
	// mux_2NtoN # (.M(M)) m2NtoN_S2 (sx, {2'b0, sx[M-1:2]}, B[1], R); //sy);
	
	//assign sx = '0;
	
	//mux_2NtoN # (.M(M)) m2NtoN_S4 (sy, {4'b0, sy[M-1:4]}, B[2], sx);
	
	//assign sy = '0;
	
	//mux_2NtoN # (.M(M)) m2NtoN_S8 (sx, {8'b0, sx[M-1:8]}, B[3], R);
	
	genvar i;
	
	generate
	
		reg  [M-1:0] s0, sy, sn;
	
		for (i = 0; 2**i <= $size(B) + 1; i++) begin : generate_shiftr
		
			wire [2**i:0] si = '0;
			
		
			if ((2**(i+1)) > $size(B) + 1) begin
				
				mux_2NtoN # (.M(M)) m2NtoN_Sm (sn, si, B[i], R);
				
				mux_2NtoN # (.M(1)) m2NtoN_V (0, 1, B[i], V);
				
			end else if (i == 0) begin
		
				mux_2NtoN # (.M(M)) m2NtoN_S0 (A, {si, A[M-1:2**i]}, B[i], s0);
				//sy = s0;
				
			end else begin
			
				mux_2NtoN # (.M(M)) m2NtoN_Si (s0, {si, s0[M-1:2**i]}, B[i], sn);
				//sy = sn;
				
			end	
			
		end
	
	endgenerate
	
endmodule

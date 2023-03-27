module ALU_param_tb;

	parameter integer M = 4;
	
	reg  [M-1:0]  A;
	reg  [M-1:0]  B;
	reg    [3:0]  F; 
	
	wire [M-1:0]   R;
	wire 			   C;
	wire 			   N;
	wire 			   V;
	wire 			   Z;
	
	ALU_param # (.M(M)) ALU_ut ( .A(A), .B(B), .F(F),
										  .R(R), .C(C), .N(N), .V(V), .Z(Z)
										);
	
	initial

	begin
	
		#5
		A <= 4'b0000; B <= 4'b1111; 
		#5
		
		$monitor("A=%b B=%b F=%b R=%b", A, B, F, R);
		
		#40
		F <= 4'b0000;
		#40
		F <= 4'b0001;
		#40
		F <= 4'b0010;
		#40
		F <= 4'b0011;
		#40
		F <= 4'b0100;
		#40
		F <= 4'b0101;
		#40
		F <= 4'b0110;
		#40
		F <= 4'b0111;
		#40
		F <= 4'b1000;
		#40
		F <= 4'b1001;
		#40
		F <= 4'b1010;
		#40
		F <= 4'b1011;
		#40
		F <= 4'b1100;
		#40
		F <= 4'b1101;
		#40
		F <= 4'b1110;
		#40
		F <= 4'b1111;
		#40;
		
		end

endmodule

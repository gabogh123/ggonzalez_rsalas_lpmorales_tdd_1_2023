module registers_ALU
	# (parameter M = 4)
	  (A, B, rst, clk, F, R, O1);
	  
	input  [M-1:0]   A;
	input  [M-1:0]   B;
	input 			 rst;
	input 			 clk;
	
	input  [3:0] 		F; // Operacion
	
	output [M-1:0]   R;
	output [M-1:0]   O1;
	
	wire  [M-1:0] 		A_alu; // Operando
	wire  [M-1:0] 		B_alu; // Operando
	wire  [M-1:0]		R_alu; // Resultado
	wire  [3:0]		flgs;
	  
	
	// Input register
	d_ff # (.M(M)) input_register (.d0(A), .d1(B),
											 .rst(rst), .clk(clk),
											 .q0(A_alu), .q1(B_alu));
	 
	// ALU
	ALU_param # (.M(M)) alu (.A(A_alu), .B(B_alu), .F(F), .R(R_alu),
									 .C(flgs[3]), .N(flgs[2]), .V(flgs[1]), .Z(flgs[0]));
	
	// Output Register
	d_ff # (.M(M)) output_register (.d0(R_alu), .d1(flgs),
											  .rst(rst), .clk(clk),
											  .q0(R), .q1(O1));  
	
endmodule

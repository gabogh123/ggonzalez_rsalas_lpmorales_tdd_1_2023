module registers_ALU
	# (parameter M = 4)
	  (I0, I1, rst, clk, F, O0, O1);
	  
	input  [M-1:0]   I0;
	input  [M-1:0]   I1;
	input 			 rst;
	input 			 clk;
	
	input  [3:0] 		F; // Operacion
	
	output [M-1:0]   O0;
	output [M-1:0]   O1;
	
	wire  [M-1:0] 		A; // Operando
	wire  [M-1:0] 		B; // Operando
	wire  [M-1:0]		R; // Resultado
	wire  [3:0]		flgs;
	  
	
	// Input register
	d_ff # (.M(M)) input_register (.d0(I0), .d1(I1),
											 .rst(rst), .clk(clk),
											 .q0(A), .q1(B));
	 
	// ALU
	ALU_param # (.M(M)) alu (.A(A), .B(B), .F(F), .R(R),
									 .C(flgs[3]), .N(flgs[2]), .V(flgs[1]), .Z(flgs[0]));
	
	// Output Register
	d_ff # (.M(M)) output_register (.d0(R), .d1(flgs),
											  .rst(rst), .clk(clk),
											  .q0(O0), .q1(O1));  
	
endmodule

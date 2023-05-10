/*
MUX 4:1
*/
module mux_4MtoM(clk, M0, M1, M2, M3, S, OM);
	  
	input  logic clk;
	input  logic [11:0] M0 		 [3:0][3:0];
	input  logic [11:0] M1 		 [3:0][3:0];
	input  logic [11:0] M2 		 [3:0][3:0];
	input  logic [11:0] M3 		 [3:0][3:0];
	input  logic [1:0]  S; 
	
	output logic [11:0] OM 		 [3:0][3:0];
	
	logic [11:0] OM0 [3:0][3:0];
	logic [11:0] OM1 [3:0][3:0];
	
	mux_2MtoM m2MtoM_0 (clk, M0, M1, S[0], OM0);
	mux_2MtoM m2MtoM_1 (clk, M2, M3, S[0], OM1);

	mux_2MtoM m2MtoM_S (clk, OM0, OM1, S[1], OM);
	
endmodule

/*
MUX 4:1
*/
module mux_4to1(I0, I1, I2, I3, S, O);

	input logic I0;
	input logic I1;
	input logic I2;
	input logic I3;
	input logic [1:0]  S; 
	
	output logic O;
	
	logic O0;
	logic O1;
	
	mux_2to1 m2to1_0 (I0, I1, S[1], O0);
	mux_2to1 m2to1_1 (I2, I3, S[1], O1);

	mux_2to1 m2to1_S (O0, O1, S[0], O);
	
endmodule

module mux_4to1 (D0, D1, D2, D3, S, Y);

	input logic D0;
	input logic D1;
	input logic D2;
	input logic D3;
	input [1:0] S;
	
	output logic Y;
	
	wire Y0;
	wire Y1;
	
	mux_2to1 m2to1_0 (D0, D1, S[1], Y0);
	mux_2to1 m2to1_1 (D2, D3, S[1], Y1);
	
	mux_2to1 m2to1_S (Y0, Y1, S[0], Y);
	
endmodule
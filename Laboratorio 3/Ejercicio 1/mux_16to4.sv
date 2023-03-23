module mux_16to4 (D0, D1, D2, D3, S, Y);

	input [4:0] D0;
	input [4:0] D1;
	input [4:0] D2;
	input [4:0] D3;
	input [1:0] S;
	
	output [4:0] Y;
	
	mux_4to1 m4to1_0 (D0[0], D1[0], D2[0], D3[0], S[1], Y[0]);
	mux_4to1 m4to1_1 (D0[1], D1[1], D2[1], D3[1], S[1], Y[1]);
	mux_4to1 m4to1_2 (D0[2], D1[2], D2[2], D3[2], S[1], Y[2]);
	mux_4to1 m4to1_3 (D0[3], D1[3], D2[3], D3[3], S[1], Y[3]);
	
endmodule
	
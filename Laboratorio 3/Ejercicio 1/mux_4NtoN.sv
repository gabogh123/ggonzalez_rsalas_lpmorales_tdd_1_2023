module mux_4NtoN 
	# (parameter N = 4)
	  (I0, I1, I2, I3, S, O);
	  
	input  logic [N-1:0] I0;
	input  logic [N-1:0] I1;
	input  logic [N-1:0] I2;
	input  logic [N-1:0] I3;
	input  logic   [1:0]  S; 
	
	output logic [N-1:0]  O;
	
	logic [N-1:0] O0;
	logic [N-1:0] O1;
	
	mux_2NtoN m2NtoN_0 (I0, I1, S[1], O0);
	mux_2NtoN m2NtoN_1 (I2, I3, S[1], O1);

	mux_2NtoN m2NtoN_S (O0, O1, S[0], O);
	
endmodule

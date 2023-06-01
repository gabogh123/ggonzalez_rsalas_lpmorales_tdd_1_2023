/*
MUX 2:1 parametrizable para N bits
*/
module mux_2NtoN
	# (parameter N = 32)
	  (I0, I1, S, O);
	
	input  logic [N-1:0] I0;
	input  logic [N-1:0] I1;
	input  logic 		  S;
	output logic [N-1:0]  O;


	assign O = S ? I1 : I0;
	
	
endmodule

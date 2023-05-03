module mux_2to1(I0, I1, S, O);
	  
	input  logic I0;
	input  logic I1;
	input  logic  S; 
	output logic  O;
				
	assign O = (I0 & ~S) | (I1 & S);
	  
endmodule

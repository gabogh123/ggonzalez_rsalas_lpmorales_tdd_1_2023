module mux_2to1 (D0, D1, S, Y);

	input logic D0;
	input logic D1;
	input logic S;
	
	output logic Y;
	
	assign Y = (D0 & ~S) | (D1 & S);

endmodule
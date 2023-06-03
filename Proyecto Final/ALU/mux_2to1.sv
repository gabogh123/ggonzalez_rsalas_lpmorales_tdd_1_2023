module mux_2to1 #(parameter N = 8)(
		input logic [N-1:0] d0,
		input logic [N-1:0] d1,
		input logic sel,
		output logic [N-1:0] y
	);
	
	assign y = sel ? d1 : d0;
	
endmodule

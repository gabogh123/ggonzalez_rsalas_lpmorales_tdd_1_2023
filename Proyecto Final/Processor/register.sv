/*

Registro parametrizable para N bits

*/
module register
	 # (parameter N = 32)
	   (clk, rst, D, Q);

	input  logic  	     clk;
	input  logic  	     rst;
	input  logic [N-1:0]   D;
	output logic [N-1:0]   Q;

	always_ff @ (posedge clk) begin

		Q <= D;
		
		if (rst)
			Q <= '0;
		
	end

endmodule

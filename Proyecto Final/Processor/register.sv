/*

Registro parametrizable para N bits

*/
module register
	 # (parameter N = 32)
	   (clk, rst, en, D, Q);

	input  logic  	     clk;
	input  logic  	     rst;
	input  logic		  en;
	input  logic [N-1:0]   D;
	output logic [N-1:0]   Q;

	always_ff @ (posedge clk or posedge rst) begin
		
		if (rst)
			Q <= '0;

		else if (en)
			Q <= D;
		
	end

endmodule

module d_ff 
	# (parameter M = 4)
	  (d0, d1, rst, clk, q0, q1);

	input logic [M-1:0] d0;
	input logic [M-1:0] d1;
	input rst;
	input clk;
	
	output [M-1:0] q0;
	output [M-1:0] q1;
	
	always_ff @ (posedge clk) begin
			
		q0 <= d0;
		q1 <= d1;
		
		if (rst) begin
		
			q0 <= '0;
			q1 <= '0;
			
		end
		
	end
		
endmodule

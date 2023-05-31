// This modules divides clock frequency by 2
module clock_divider (
		input logic in_clk, //50 MHz
		input logic rst, 
		output logic out_clk //25MHz
	);

	always @(posedge in_clk, posedge rst) begin
		if (rst)
			out_clk <= 0;
		else if (in_clk)
			out_clk <= ~out_clk;
	end

endmodule

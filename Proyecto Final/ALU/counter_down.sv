module counter_down #(parameter N=8) (
		 input logic clk,
		 input logic reset,
		 input logic [N-1:0] init_value,
		 output logic [N-1:0] count
	);
	always_ff @(negedge clk, negedge reset)
		if (!reset)
			count <= init_value;
		else if (!clk)
			count <= count - 1;
endmodule

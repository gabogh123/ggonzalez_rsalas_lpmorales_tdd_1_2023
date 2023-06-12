module counter_up #(parameter N=4) (
		 input logic clk,
		 input logic reset,
		 input logic [N-1:0] init_value,
		 input logic [N-1:0] max_value,
		 output logic [N-1:0] count
	);
	always_ff @(negedge clk, negedge reset)
		if (!reset)
			count <= init_value;
		else if (!clk)
			if (count === max_value)
				count <= init_value;
			else
				count <= count + 1;
endmodule

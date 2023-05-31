module counter_4_bits (
		input logic clk, rst,
		output logic [3:0] count
	);
	always_ff @(posedge clk, posedge rst)
		if (rst)
			count <= 4'b0000; 
		else begin 
			if (count === 4'b1111)
				count <= 4'b0000;
			else
				count <= count + 1;
		end
endmodule

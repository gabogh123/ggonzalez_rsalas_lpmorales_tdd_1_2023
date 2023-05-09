module module_enable_summation(Q, enable);
	
	input logic [1:0]  Q;
	output enable;
	
	assign enable = (!Q[1] & Q[0]) | (Q[1] & !Q[0]);


endmodule

module half_adder (input a,b, output sum, car);

	assign sum = a ^ b; // sum of half adder
	assign car = a & b; // carry of half adder 

endmodule
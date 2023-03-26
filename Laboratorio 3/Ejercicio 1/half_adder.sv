module half_adder (input a,b, output sum, car);

	sum = a ^ b; // sum of half adder
	car = a & b; // carry of half adder 

endmodule
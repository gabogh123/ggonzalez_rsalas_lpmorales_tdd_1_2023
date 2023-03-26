module full_adder(input a, b, cin, output sum, cout);

	sum = a ^ b ^ cin;
	cout = (a & b) | (cin & (a ^ b));

endmodule
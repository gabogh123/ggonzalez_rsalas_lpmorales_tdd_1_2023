module full_adder(input A, B, cin, output R, cout);

	assign R = (A ^ B) ^ cin;
	assign cout = (A & B) || (cin & (A ^ B));

endmodule
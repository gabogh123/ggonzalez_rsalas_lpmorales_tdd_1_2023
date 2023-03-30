module half_subtractor(a,b,y,z);

	input a,b;
	output y,z;

	wire x;

	assign y = a ^ b;

	assign z = x & b;

	assign x = ~a;

endmodule
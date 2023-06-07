/*
Test Bench para MUX 8:1 parametrizable para N bits
*/
module mux4NtoN_tb;

	parameter integer N = 32;

	reg  [N-1:0] I0;
	reg  [N-1:0] I1;
	reg  [N-1:0] I2;
	reg  [N-1:0] I3;
	reg    [1:0]  S;
	reg      enable;
	reg  [N-1:0]  O;

	mux_4NtoN # (.N(N)) uut (.I0(I0),
							 .I1(I1),
							 .I2(I2),
							 .I3(I3),
							 .enable(enable),
							 .S(S),
							 .O(O));
	
	initial begin
		$display("mux4NtoN Test Bench:\n");

		I0 <= 32'b0;
		I1 <= 32'b0;
		I2 <= 32'b0;
		I3 <= 32'b0;
		S <= 2'b00;
		enable <= 0;

		$monitor("S=%b enable=%b\n", S, enable,
				 "I0=%b I1=%b I2=%b I3=%b\n", I0, I1, I2, I3,
				 "O=%b\n", O);
	end

		initial	begin
	
		#100

		I0 <= 32'b11100101100111110001000000100000;
		I1 <= 32'b00101000101001000100111010101111;
		I2 <= 32'b00010010001000100010010110101000;
		I3 <= 32'b01010000000010101001110101001001;

		#50

		enable = 1;

		#50

		S <= 2'b00;

		#100
		
		assert((O === 32'b11100101100111110001000000100000))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 2'b01;

		#100
		
		assert((O === 32'b00101000101001000100111010101111))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 2'b10;

		#100
		
		assert((O === 32'b00010010001000100010010110101000))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 2'b11;

		#100
		
		assert((O === 32'b01010000000010101001110101001001))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#50
		
		enable = 0;

		#50

		S <= 2'b00;

		#100
		
		assert((O === 32'b0))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 2'b10;

		#100
		
		assert((O === 32'b0))
		else $error("Failed when S=%b with enable=%b", S, enable);

		#100;

		// Done

	end

endmodule
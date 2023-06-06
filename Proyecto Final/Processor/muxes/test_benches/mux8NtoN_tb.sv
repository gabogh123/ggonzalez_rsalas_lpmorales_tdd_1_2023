/*
Test Bench para MUX 8:1 parametrizable para N bits
*/
module mux8NtoN_tb;

	parameter integer N = 32;

	reg  [N-1:0] I0;
	reg  [N-1:0] I1;
	reg  [N-1:0] I2;
	reg  [N-1:0] I3;
	reg  [N-1:0] I4;
	reg  [N-1:0] I5;
	reg  [N-1:0] I6;
	reg  [N-1:0] I7;
	reg    [2:0]  S;
	reg      enable;
	reg  [N-1:0]  O;	

	mux_8NtoN # (.N(N)) uut (.I0(I0),
							 .I1(I1),
							 .I2(I2),
							 .I3(I3),
							 .I4(I4),
							 .I5(I5),
							 .I6(I6),
							 .I7(I7),
							 .enable(enable),
							 .S(S),
							 .O(O));

	initial begin
		$display("mux8NtoN Test Bench:\n");

		I0 <= 32'b0;
		I1 <= 32'b0;
		I2 <= 32'b0;
		I3 <= 32'b0;
		I4 <= 32'b0;
		I5 <= 32'b0;
		I6 <= 32'b0;
		I7 <= 32'b0;
		S <= 3'b000;
		enable <= 0;

		$monitor("S=%b enable=%b\n", S, enable,
				 "I0=%b I1=%b I2=%b I3=%b\n", I0, I1, I2, I3,
				 "I4=%b I5=%b I6=%b I7=%b\n", I4, I5, I6, I7,
				 "O=%b\n", O);
	end
	
	initial	begin
	
		#100

		I0 <= 32'b11100101100111110001000000100000;
		I1 <= 32'b10101010000000000000000000000100;
		I2 <= 32'b01010010001001001001000100101010;
		I3 <= 32'b00101000101001000100111010101111;
		I4 <= 32'b11111010110110110110111011011011;
		I5 <= 32'b00010010001000100010010110101000;
		I6 <= 32'b01010000000010101001110101001001;
		I7 <= 32'b11101000100101011101001001110101;

		#50

		enable = 1;

		#50

		S <= 3'b000;

		#100
		
		assert((O === 32'b11100101100111110001000000100000))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 3'b001;

		#100
		
		assert((O === 32'b10101010000000000000000000000100))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 3'b010;

		#100
		
		assert((O === 32'b01010010001001001001000100101010))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 3'b011;

		#100
		
		assert((O === 32'b00101000101001000100111010101111))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 3'b100;

		#100
		
		assert((O === 32'b11111010110110110110111011011011))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 3'b101;

		#100
		
		assert((O === 32'b00010010001000100010010110101000))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 3'b110;

		#100
		
		assert((O === 32'b01010000000010101001110101001001))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 3'b111;

		#100
		
		assert((O === 32'b11101000100101011101001001110101))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#50
		
		enable = 0;

		#50

		S <= 3'b001;

		#100
		
		assert((O === 32'b0))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 3'b010;

		#100
		
		assert((O === 32'b0))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100

		S <= 3'b100;

		#100
		
		assert((O === 32'b0))
		else $error("Failed when S=%b with enable=%b", S, enable);
		
		#100;

		// Done
		
    end

endmodule

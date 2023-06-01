module mux2NtoN_tb;

	parameter integer N = 32;

	reg  [N-1:0] I0;
	reg  [N-1:0] I1;
	reg   	      S;
	
	wire [N-1:0]  O;	

	mux_2NtoN # (.N(N)) uut (.I0(I0),
							 .I1(I1),
							 .S(S),
							 .O(O));

	initial begin
		$display("mux2NtoN Test Bench:\n");

		I0 <= 32'b0;
		I1 <= 32'b0;
		S <= 0;

		$monitor("I0=%b I1=%b S=%b O=%b", I0, I1, S, O);

	end
	
	initial	begin
	
		#100

		I0 <= 32'b11100101100111110001000000100000;
		I1 <= 32'b10101010000000000000000000000100;
		S <= 1;

		#100
		
		assert((O === 32'b10101010000000000000000000000100)) else $error("Failed");
		
		#100
		
		I0 <= 32'b11100011101000000000000000000000;
		I1 <= 32'b11100001101000000010000010100010;
		S <= 0;

		#100
		
		assert((O === 32'b11100011101000000000000000000000)) else $error("Failed");
		
		#100;

		// Done
		
    end

endmodule
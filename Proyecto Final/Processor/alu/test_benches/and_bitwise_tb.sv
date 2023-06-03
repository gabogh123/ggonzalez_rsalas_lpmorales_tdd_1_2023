module and_bitwise_tb();

	logic [3:0] a, b, y;

	and_bitwise #(4) dut_and(a, b, y);
	
	initial begin
		a <= 4'b1010;
		b <= 4'b1010;
		#5;
		assert(y === 4'b1010) else $error("failed %b & %b", a, b);

		a <= 4'b1010;
		b <= 4'b0101;
		#5;
		assert(y === 4'b0000) else $error("failed %b & %b", a, b);
		
		a <= 4'b1010;
		b <= 4'b0110;
		#5;
		assert(y === 4'b0010) else $error("failed %b & %b", a, b);
	end
endmodule
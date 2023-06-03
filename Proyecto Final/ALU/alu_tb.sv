module alu_tb();

	logic [3:0] a4, b4, sum4, f_sum4, sub4, f_sub4, mult4, f_mult4, div4, mod4, f_div4, and4, or4, xor4, shiftl4, shiftr4;

	adder #(4) dut_adder (a4, b4, 1'b0, sum4, f_sum4);
	subtractor #(4) dut_sub (a4, b4, sub4, f_sub4);
	multiplier #(4) dut_mult (a4, b4, mult4, f_mult4);
	divider #(4) dut_div (a4, b4, div4, mod4, f_div4);
	and_bitwise #(4) dut_and(a4, b4, and4);
	or_bitwise #(4) dut_or(a4, b4, or4);
	xor_bitwise #(4) dut_xor(a4, b4, xor4);
	shift #(4) dut_shift_l(a4,b4,1'b1,shiftl4);
	shift #(4) dut_shift_r(a4,b4,1'b0,shiftr4);

	
	initial begin
		
		$display("\nTesting 4 bit ALU:\n");

		$display("\nTesting Adder...\n");
		a4 <= 4'b0100;
		b4 <= 4'b0100; 
		#10
		assert((f_sum4 === 4'b0001) & (sum4 === 4'b1000)) else $error("failed %b + %b = 1000", a4, b4);

		a4 <= 4'b1111;
		b4 <= 4'b0010;
		#10
		assert((f_sum4 === 4'b0010) & (sum4 === 4'b0001)) else $error("failed %b + %b = 0001", a4, b4);

		$display("\nTesting Subtractor...\n");
		a4 <= 4'b1010;
		b4 <= 4'b0110;
		#10
		assert((sub4 === 4'b0100) & (f_sub4 === 4'b0001)) else $error("failed %b - %b = 0100", a4, b4);

		a4 <= 4'b1111;
		b4 <= 4'b1111;
		#10
		assert((sub4 === 4'b0000) & (f_sub4 === 4'b0100)) else $error("failed %b - %b = 0000", a4, b4);

		$display("\nTesting Multiplier...\n");
		a4 <= 4'b0010;
		b4 <= 4'b0010;
		#10
		assert(mult4 === 4'b0100) else $error("failed %b * %b = 0100", a4, b4);

		a4 <= 4'b0011;
		b4 <= 4'b0100;
		#10
		assert(mult4 === 4'b1100) else $error("failed %b * %b = 1100", a4, b4);

		$display("\nTesting Divider and Module...\n");
		a4 <= 4'b1010;
		b4 <= 4'b0010;
		#10
		assert((div4 === 4'b0101) & (mod4 === 4'b0000)) else $error("failed %b / %b = 0101", a4, b4);

		a4 <= 4'b1000;
		b4 <= 4'b0010;
		#10
		assert((div4 === 4'b0100) & (mod4 === 4'b0000)) else $error("failed %b / %b = 0100", a4, b4);

		a4 <= 4'b0101;
		b4 <= 4'b0010;
		#10
		assert((div4 === 4'b0010) & (mod4 === 4'b0001)) else $error("failed %b / %b = 0010", a4, b4);
		
		a4 <= 4'b1010;
		b4 <= 4'b0011;
		#10
		assert((div4 === 4'b0011) & (mod4 === 4'b0001)) else $error("failed %b / %b = 0011", a4, b4);

		$display("\nTesting AND...\n");
		a4 <= 4'b1010;
		b4 <= 4'b1010;
		#10;
		assert(and4 === 4'b1010) else $error("failed %b & %b", a4, b4);

		a4 <= 4'b1010;
		b4 <= 4'b0101;
		#10;
		assert(and4 === 4'b0000) else $error("failed %b & %b", a4, b4);

		$display("\nTesting OR...\n");
		a4 <= 4'b1010;
		b4 <= 4'b1010;
		#10;
		assert(or4 === 4'b1010) else $error("failed %b | %b", a4, b4);

		a4 <= 4'b1010;
		b4 <= 4'b0101;
		#10;
		assert(or4 === 4'b1111) else $error("failed %b | %b", a4, b4);

		$display("\nTesting XOR...\n");
		a4 <= 4'b1010;
		b4 <= 4'b1010;
		#10;
		assert(xor4 === 4'b0000) else $error("failed %b ^ %b", a4, b4);

		a4 <= 4'b1010;
		b4 <= 4'b0101;
		#10;
		assert(xor4 === 4'b1111) else $error("failed %b ^ %b", a4, b4);

		$display("\nTesting shift left...\n");
		a4 <= 4'b0011;
		b4 <= 4'b0001;
		#10
		assert(shiftl4 === 4'b0110) else $error("failed for %b << %d = %b", a4, b4, shiftl4);

		a4 <= 4'b0001;
		b4 <= 4'b0010;
		#10
		assert(shiftl4 === 4'b0100) else $error("failed for %b << %d = %b", a4, b4, shiftl4);

		$display("\nTesting shift right...\n");
		a4 <= 4'b0010;
		b4 <= 4'b0001;
		#10
		assert(shiftr4 === 4'b0001) else $error("failed for %b >> %d = %b", a4, b4, shiftr4);

		a4 <= 4'b1100;
		b4 <= 4'b0010;
		#10
		assert(shiftr4 === 4'b0011) else $error("failed for %b >> %d = %b", a4, b4, shiftr4);

      $finish;
		
	end

endmodule
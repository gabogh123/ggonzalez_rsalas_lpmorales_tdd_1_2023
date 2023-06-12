module shift_1_bit_tb;

		logic [3:0] a4, y4;
		logic [7:0] a8, y8;

		logic d;

		shift_1_bit #(4) dut_shift4(a4,d,y4);
		shift_1_bit #(8) dut_shift8(a8,d,y8);

		initial begin
			a4 <= 4'b0001;
			a8 <= 8'b00010000;
			d <= 1'b1;
			#2 //shift left
			assert(y4 === 4'b0010) else $error("failed for %b << 1 = %b", a4, y4);
			assert(y8 === 8'b00100000) else $error("failed for %b << 1 = %b", a8, y8);
			
			a4 <= 4'b1001;
			a8 <= 8'b10011001;
			d <= 1'b1;
			#2 //shift left
			assert(y4 === 4'b0010) else $error("failed for %b << 1 = %b", a4, y4);
			assert(y8 === 8'b00110010) else $error("failed for %b << 1 = %b", a8, y8);
			
			a4 <= 4'b1000;
			a8 <= 8'b10001111;
			d <= 1'b0;
			#2 //shift right
			assert(y4 === 4'b0100) else $error("failed for %b >> 1 = %b", a4, y4);
			assert(y8 === 8'b01000111) else $error("failed for %b << 1 = %b", a8, y8);

			a4 <= 4'b1001;
			a8 <= 8'b10011001;
			d <= 1'b0;
			#2 //shift right
			assert(y4 === 4'b0100) else $error("failed for %b >> 1 = %b", a4, y4);
			assert(y8 === 8'b01001100) else $error("failed for %b << 1 = %b", a8, y8);

			$finish;
		end
endmodule

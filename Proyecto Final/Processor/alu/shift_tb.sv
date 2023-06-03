module shift_tb();
	
		logic [3:0] a;
		logic [3:0] b;
		logic d;
		logic [3:0] y;

		shift #(4) dut_shift(a,b,d,y);

		initial begin
			a <= 4'b0001;
			b <= 4'b0010;
			d <= 1'b1;
			#2 //shift left
			assert(y === 4'b0100) else $error("failed for %b << %d = %b", a, b, y);
			
			a <= 4'b1010;
			b <= 4'b0010;
			d <= 1'b1;
			#2 //shift left
			assert(y === 4'b1000) else $error("failed for %b << %d = %b", a, b, y);

			a <= 4'b1000;
			b <= 4'b0011;
			d <= 1'b0;
			#2 //shift right
			assert(y === 4'b0001) else $error("failed for %b >> %d = %b", a, b, y);

			a <= 4'b1001;
			b <= 4'b0001;
			d <= 1'b0;
			#2 //shift right
			assert(y === 4'b0100) else $error("failed for %b >> %d = %b", a, b, y);

			$finish;
		end


endmodule
module divider_tb();

	logic [3:0] a, b, y, mod, f;

	divider #(4) dut(a, b, y, mod, f);
	
	initial begin
		a <= 4'b1010;
		b <= 4'b0010;
		#10
		assert((y === 4'b0101) & (mod === 4'b0000)) else $error("failed %b / %b = %b", a, b, y);

		a <= 4'b1000;
		b <= 4'b0010;
		#10
		assert((y === 4'b0100) & (mod === 4'b0000)) else $error("failed %b / %b = %b", a, b, y);

		a <= 4'b0101;
		b <= 4'b0010;
		#10
		assert((y === 4'b0010) & (mod === 4'b0001)) else $error("failed %b / %b = %b", a, b, y);
		
		a <= 4'b1010;
		b <= 4'b0011;
		#10
		assert((y === 4'b0011) & (mod === 4'b0001)) else $error("failed %b / %b = %b", a, b, y);
		
		a <= 4'b1000;
		b <= 4'b0100;
		#10
		assert((y === 4'b0010) & (mod === 4'b0000)) else $error("failed %b / %b = %b", a, b, y);
		
		a <= 4'b1100;
		b <= 4'b0100;
		#10
		assert((y === 4'b0011) & (mod === 4'b0000)) else $error("failed %b / %b = %b", a, b, y);

		a <= 4'b1100;
		b <= 4'b0001;
		#10
		assert((y === 4'b1100) & (mod === 4'b0000)) else $error("failed %b / %b = %b", a, b, y);
		
	$finish;
	end
endmodule
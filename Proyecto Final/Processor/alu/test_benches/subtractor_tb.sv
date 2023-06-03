module subtractor_tb();
	logic [3:0] a4;
	logic [3:0] b4;
	logic [3:0] sub4, f_sub4, f_sub8;
	
	logic [7:0] a8;
	logic [7:0] b8;
	logic [7:0] sub8;

	subtractor #(4) dut_4bits (a4, b4, sub4, f_sub4);
	subtractor #(8) dut_8bits (a8, b8, sub8, f_sub8);
	
	initial begin
		a4 <= 4'b1010; //d10
		b4 <= 4'b0110; //d6
		
		a8 <= 8'b11111010; //d250
		b8 <= 8'b00111000; //d56
		
		#2
		assert((sub4 === 4'b0100) & (f_sub4 === 4'b0001)) else $error("failed %b + %b = 0100", a4, b4);
		assert((sub8 === 8'b11000010 & (f_sub8 === 4'b0000))) else $error("failed %b + %b = 11000010", a8, b8);
		
		a4 <= 4'b0011;
		b4 <= 4'b0110;
		#2
		assert((sub4 === 4'b1101) & (f_sub4 === 4'b1000)) else $error("failed %b + %b = 0011", a4, b4);
		
		a4 <= 4'b1111;
		b4 <= 4'b1111;
		#2
		assert((sub4 === 4'b0000) & (f_sub4 === 4'b1000)) else $error("failed %b + %b = 0000", a4, b4);
		
	$finish;
	end
endmodule

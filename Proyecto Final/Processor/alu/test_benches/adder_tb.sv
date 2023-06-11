module adder_tb();

	logic [3:0] a4;
	logic [3:0] b4;
	logic [3:0] sum4, f_sum4, f_sum8;
	
	logic [7:0] a8;
	logic [7:0] b8;
	logic [7:0] sum8;

	adder #(4) dut_4bits (a4, b4, 1'b0, sum4, f_sum4);
	adder #(8) dut_8bits (a8, b8, 1'b0, sum8, f_sum8);
	
	initial begin
		a4 <= 4'b0100;
		b4 <= 4'b0100; 
		
		a8 <= 8'b11111010; //d250
		b8 <= 8'b00111000; //d56
		
		#10
		assert((f_sum4 === 4'b0001) & (sum4 === 4'b1000)) else $error("failed %b + %b = 1000", a4, b4);
		assert((f_sum8 === 4'b0010) & (sum8 === 8'b00110010)) else $error("failed %b + %b = 1 0011 0010", a8, b8);
		
		a4 <= 4'b1111;
		b4 <= 4'b0010;
		#10
		assert((f_sum4 === 4'b0010) & (sum4 === 4'b0001)) else $error("failed %b + %b = 0001", a4, b4);
		
		a4 <= 4'b1111;
		b4 <= 4'b1111;
		#10
		assert((f_sum4 === 4'b0010) & (sum4 === 4'b1110)) else $error("failed %b + %b = 1110", a4, b4);

		a4 <= 4'b1111;
		b4 <= 4'b0001;
		#10
		assert((f_sum4 === 4'b0110) & (sum4 === 4'b0000)) else $error("failed %b + %b = 0000", a4, b4);

		a4 <= 4'b0111;
		b4 <= 4'b0010;
		#10
		assert((f_sum4 === 4'b0001) & (sum4 === 4'b1001)) else $error("failed %b + %b = 1001", a4, b4);

		a4 <= 4'b1001;
		b4 <= 4'b1001;
		#10
		assert((f_sum4 === 4'b0011) & (sum4 === 4'b0010)) else $error("failed %b + %b = 0010", a4, b4);
		
	$finish;
	end
endmodule

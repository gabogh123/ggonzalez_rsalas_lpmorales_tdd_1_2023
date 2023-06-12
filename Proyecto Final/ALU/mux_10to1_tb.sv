module mux_10to1_tb();
	logic [3:0] sum;
	logic [3:0] sub;
	logic [3:0] mult;
	logic [3:0] div;
	logic [3:0] mod;
	logic [3:0] and_;
	logic [3:0] or_;
	logic [3:0] xor_;
	logic [3:0] shift_l;
	logic [3:0] shift_r;

	logic [3:0] sel;
	
	logic [3:0] y;
	
	mux_10to1 #(4) dut_mux (sum, sub, mult, div, mod, and_, or_, xor_, shift_l, shift_r, sel, y);
	
	initial begin
		sum <= 4'b0000;
		sub <= 4'b0001;
		mult <= 4'b0010;
		div <= 4'b0011;
		mod <= 4'b0100;
		and_ <= 4'b0101;
		or_ <= 4'b0110;
		xor_ <= 4'b0111;
		shift_l <= 4'b1000;
		shift_r <= 4'b1001;
		
		sel <= 4'b0000;
		#2
		assert(y === 4'b0000) else $error("failed sel = %b", sel);
		
		sel <= 4'b0001;
		#2
		assert(y === 4'b0001) else $error("failed sel = %b", sel);
		
		sel <= 4'b0010;
		#2
		assert(y === 4'b0010) else $error("failed sel = %b", sel);
		
		sel <= 4'b0011;
		#2
		assert(y === 4'b0011) else $error("failed sel = %b", sel);
		
		sel <= 4'b0100;
		#2
		assert(y === 4'b0100) else $error("failed sel = %b", sel);
		
		sel <= 4'b0101;
		#2
		assert(y === 4'b0101) else $error("failed sel = %b", sel);
		
		sel <= 4'b0110;
		#2
		assert(y === 4'b0110) else $error("failed sel = %b", sel);
		
		sel <= 4'b0111;
		#2
		assert(y === 4'b0111) else $error("failed sel = %b", sel);
		
		sel <= 4'b1000;
		#2
		assert(y === 4'b1000) else $error("failed sel = %b", sel);
		
		sel <= 4'b1001;
		#2
		assert(y === 4'b1001) else $error("failed sel = %b", sel);
		
	$finish;
	end
endmodule
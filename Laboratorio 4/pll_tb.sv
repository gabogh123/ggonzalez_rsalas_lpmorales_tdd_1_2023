module pll_tb();
	logic clk, rst, vga_clk;

	vga_controller dut(clk, rst, vga_clk);

	always #10 clk = ~clk; //Generating 50MHz clock

	initial begin
		rst = 1'b0;
		repeat(3)@ (negedge clk);
		rst = 1'b1;
	end
	
endmodule

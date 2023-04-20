module vga_controller (
		input logic input_clk, // 50 MHz
		input logic rst, 
		output logic output_clk // f = 25.175 MHz -> period = 39.772 ns	
	);
	
	pll_ip pll (
		.refclk   (input_clk),   //  refclk.clk
		.rst      (rst),      //   reset.reset
		.outclk_0 (output_clk), // outclk0.clk
		.locked   ()    //  locked.export
	);
	
endmodule

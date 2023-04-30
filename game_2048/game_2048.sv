module game_2048(
		input logic clk, rst,
		input logic [3:0] buttons, // [3] left, [2] down, [1] up, [0] right
		output logic vgaclk, // 25 MHz VGA clock
		output logic hsync, vsync,
		output logic sync_b, blank_b, // To monitor & DAC
		output logic [7:0] r, g, b // To video DAC
	);

	

endmodule
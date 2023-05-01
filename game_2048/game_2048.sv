module game_2048(
		input logic clk, rst_game, rst_vga,
		input logic [3:0] buttons, // [3] left, [2] down, [1] up, [0] right
		input logic [3:0] switches,
		output logic vgaclk, // 25 MHz VGA clock
		output logic hsync, vsync,
		output logic sync_b, blank_b, // To monitor & DAC
		output logic [7:0] r, g, b, // To video DAC,
		output logic [0:6] disp_0
	);
	logic done_random_tile, any_button, won, lost;
	logic [2:0] D;
	logic [2:0] Q;
	logic [3:0] rand_pos;
	logic [11:0] matrix [3:0][3:0] = '{'{12'd4, 12'd16, 12'd0, 12'd0}, 
						'{12'd2, 12'd0, 12'd0, 12'd0},
						'{12'd0, 12'd0, 12'd0, 12'd0},
						'{12'd2, 12'd0, 12'd0, 12'd0}};

	assign won = 0;
	assign lost = 0;

    or_n_inputs #(4) or_buttons (~buttons, any_button);

	lfsr random_position(Q[0], rst_game, 4'b1111, rand_pos);

	current_state current_state (clk, rst_game, D, Q);
	next_state next_state(Q, any_button, won, lost, rst_game, D);

	vga vga_display(clk, rst_vga, matrix, Q, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);

	seven_seg_decoder display_state(Q, disp_0);

endmodule
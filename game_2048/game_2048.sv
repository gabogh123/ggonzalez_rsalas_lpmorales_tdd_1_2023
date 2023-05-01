module game_2048(
		input logic clk, rst_game, rst_vga,
		input logic [3:0] buttons, // [3] left, [2] down, [1] up, [0] right
		input logic [3:0] switches,
		output logic vgaclk, // 25 MHz VGA clock
		output logic hsync, vsync,
		output logic sync_b, blank_b, // To monitor & DAC
		output logic [7:0] r, g, b, // To video DAC,
		output logic [0:6] disp_0, disp_2
	);
	logic any_button, won, lost;
	logic [2:0] D; // next state
	logic [2:0] Q; // current state
	logic [11:0] matrix_D [3:0][3:0]; // next state matrix
	logic [11:0] matrix_Q [3:0][3:0]; // current state matrix
	
	assign won = 0;
	assign lost = 0;

	// senses for any button to be pushed
    or_n_inputs #(4) or_buttons (~buttons, any_button);
	
	// handle FSM's current and next state logic 
	current_state current_state (clk, rst_game, D, matrix_D, Q, matrix_Q);
	next_state next_state(Q , any_button, won, lost, rst_game, D);

	// handle matrix changes
	update_matrix update_mat(clk, rst_game, Q, any_button, matrix_Q, matrix_D);

	// display game on screen depending on the current state 
	vga vga_display(clk, rst_vga, matrix_Q, Q, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);

	seven_seg_decoder display_state(Q, disp_0);
	seven_seg_decoder display_rand(4'b0, disp_2);

endmodule
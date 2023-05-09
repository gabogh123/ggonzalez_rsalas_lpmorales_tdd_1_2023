module game_2048(
		input logic clk, rst_game, rst_vga,
		input logic [3:0] buttons, // [3] left, [2] down, [1] up, [0] right
		input logic [3:0] switches,
		output logic vgaclk, // 25 MHz VGA clock
		output logic hsync, vsync,
		output logic sync_b, blank_b, // To monitor & DAC
		output logic [7:0] r, g, b, // To video DAC,
		output logic [0:6] disp_0, disp_1, disp_2, disp_3
	);
	logic any_button;
	logic [2:0] D; // next state
	logic [2:0] Q; // current state
	logic [11:0] matrix_Q [3:0][3:0]; // current state matrix
	logic [11:0] matrix_D [3:0][3:0]; // next state matrix
	
	logic [1:0] wl;
	// assign won = 0;
	// assign lost = 0;
	logic trigger, won, los;

	assign won = 0;
	assign lost = 0;

	// senses for any button to be pushed
    or_n_inputs #(4) or_buttons (~buttons, any_button);

	always_comb begin
        trigger = any_button; //| ~won | ~lost;
    end
	
	// handle FSM's current and next state logic 
	current_state current_state (clk, rst_game, D, matrix_D, Q, matrix_Q);
	next_state next_state(Q , any_button, wl[0], wl[1], rst_game, D);
	/* Aqui entran el won, lost que viene de update_matrix*/

	// handle matrix changes
	update_matrix update_mat(clk, rst_game, Q, switches, buttons, any_button, matrix_Q, matrix_D, wl);
	/* se agregaron switches y buttons, necesarios para game_logic*/
	/* podriamos meter el or_n_inputs dentro para no enviar aqui any_button*/
	/* won, lost salen de aqui no? */
	next_state next_state(Q, trigger, won, lost, rst_game, D);

	// handle matrix changes
	update_matrix update_mat(clk, Q, any_button, matrix_Q, matrix_D);

	// display game on screen depending on the current state 
	vga vga_display(clk, rst_vga, matrix_Q, Q, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);

	// set 7 segments displays to show current score or the goal settings
	set_displays set_displays(D, switches, matrix_Q, disp_0, disp_1, disp_2, disp_3);

endmodule
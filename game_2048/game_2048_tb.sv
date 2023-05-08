module game_2048_tb();
    logic clk, rst_game;
    logic [3:0] buttons;
    logic [2:0] Q, D;

	current_state dut_current_state (clk, rst_game, D, Q);
	next_state dut_next_state(Q, buttons, D);

    always #5 clk = ~clk;
        
    initial begin
        clk = 0;
        rst_game = 1;
        buttons = 4'b0000;
        #10;
        rst_game = 0;

        buttons[0] = 1;
        #10 buttons[0] = 0;
        $display("State: %d ", Q);
        #10 $finish;
    end


endmodule
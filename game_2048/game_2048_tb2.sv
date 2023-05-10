module game_2048_tb2();

    logic rst_vga;
    logic vgaclk; // 25 MHz VGA clock
    logic hsync, vsync;
    logic sync_b, blank_b; // To monitor & DAC
    logic [7:0] r, g, b; // To video DAC,
    logic [0:6] disp_0, disp_1, disp_2, disp_3;

    logic [15:0] t;
    logic clk;
    logic rst_game;
	logic [3:0] direction;
    logic [3:0] goal;
    
    logic any_button;
    logic trigger;
    logic [2:0] D;
	logic [2:0] Q;
    logic [11:0] matrix_Q [3:0][3:0];
	logic [11:0] matrix_D [3:0][3:0];
    logic [1:0] wl;


    game_2048 uut (clk, rst_game, rst_vga, direction, goal, vgaclk, hsync, vsync,
                   sync_b, blank_b, r, g, b, disp_0, disp_1, disp_2, disp_3);

    initial begin

        $monitor("\ngoal: %b\ndirection: %b\nActual State: %b\nmatrix_Q:\n%p\n%p\n%p\n%p\nNext State: %b\nmatrix_D:\n%p\n%p\n%p\n%p\nW: %b - L: %b\n",
				~goal, ~direction,
                Q,
				matrix_Q[3][3:0],   matrix_Q[2][3:0],
				matrix_Q[1][3:0],   matrix_Q[0][3:0],
                D,
                matrix_D[3][3:0],   matrix_D[2][3:0],
				matrix_D[1][3:0],   matrix_D[0][3:0],
				wl[1], wl[0]);

        clk = 0;
        rst_game = 0;
        goal = 4'b1111;
		direction = 4'b1111;
        t = 0;

    end

    always begin

		#10 clk = !clk;

        t += 4'b1010;

        any_button = uut.any_button;
        trigger = uut.trigger;
        Q = uut.Q;
        D = uut.D;
        matrix_Q = uut.matrix_Q;
        matrix_D = uut.matrix_D;
        wl = uut.wl;
        
    end

    initial begin

        #40 rst_game = 1;
		#20 rst_game = 0;

        #30
        goal = ~1010; #20 
        direction = ~4'b0001; #40
        $display("\ntime: %d ps", t);
        direction = ~4'b0000; #80

        direction = ~4'b0010; #40
        $display("\ntime: %d ps", t);
        direction = ~4'b0000; #80

        direction = ~4'b0100; #40
        $display("\ntime: %d ps", t);
        direction = ~4'b0000; #80;

    end

    initial
	#1000 $finish;
		 

endmodule

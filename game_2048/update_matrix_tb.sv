module update_matrix_tb();

    logic        clk;
    logic [2:0]  Q;
    logic [3:0]  goal;
    logic [3:0]  direction;
    logic        buttons;
    logic [11:0] matrix_Q [3:0][3:0];
    logic [11:0] matrix_D [3:0][3:0];
    logic [1:0]  wl;
    logic en_check;
    logic en_game_logic;

    logic sel_mux;

    update_matrix_2 uut (clk, Q, goal, direction, buttons, matrix_Q,
                       matrix_D, wl);
	
    initial begin
		$display("Inicia sistema");

		clk = 0;
		Q = 3'b000;
    goal = 4'b0100;
		direction = 4'b0000;
    buttons = 0;
		matrix_Q = '{'{12'd0, 12'd0, 12'd0, 12'd0},
				         '{12'd0, 12'd0, 12'd0, 12'd0},
				         '{12'd0, 12'd0, 12'd0, 12'd0},
				         '{12'd0, 12'd0, 12'd0, 12'd0}};
	end

    always begin
		#10 clk = !clk;
        sel_mux = uut.sel;
        en_check = uut.en_check;
        en_game_logic = uut.en_game_logic;

    end

    initial begin

        /*
         $display("\ndirection: %b\ngoal: %b\nmatrix_Q:\n%p\n%p\n%p\n%p\nW: %b - L: %b\n",
				direction, goal,
				matrix_Q[3][3:0],   matrix_Q[2][3:0],
				matrix_Q[1][3:0],   matrix_Q[0][3:0],
				wl[1], wl[0]);
        */

        #30
        
        Q = 3'b000;
        direction = 4'b0001;
        buttons = 1;


        matrix_Q = matrix_D;

       

        #40
        buttons = 0;
        #40

        Q = 3'b001;
        buttons = 1;
        matrix_Q = matrix_D;

        $display("\ndirection: %b\ngoal: %b\nmatrix_Q:\n%p\n%p\n%p\n%p\nW: %b - L: %b\n",
				direction, goal,
				matrix_Q[3][3:0],   matrix_Q[2][3:0],
				matrix_Q[1][3:0],   matrix_Q[0][3:0],
				wl[1], wl[0]);

        #40
        buttons = 0;
        #40



        Q = 3'b010;
        buttons = 1;
        matrix_Q = matrix_D;

        $display("\ndirection: %b\ngoal: %b\nmatrix_Q:\n%p\n%p\n%p\n%p\nW: %b - L: %b\n",
				direction, goal,
				matrix_Q[3][3:0],   matrix_Q[2][3:0],
				matrix_Q[1][3:0],   matrix_Q[0][3:0],
				wl[1], wl[0]);

        #40
        buttons = 0;
        #40

        buttons = 1;
        direction = 4'b0001;
        Q = 3'b011;
        matrix_Q = matrix_D;

        $display("\ndirection: %b\ngoal: %b\nmatrix_Q:\n%p\n%p\n%p\n%p\nW: %b - L: %b\n",
				direction, goal,
				matrix_Q[3][3:0],   matrix_Q[2][3:0],
				matrix_Q[1][3:0],   matrix_Q[0][3:0],
				wl[1], wl[0]);

        #40
        buttons = 0;

        #100

        Q = 3'b010;
        buttons = 1;
        matrix_Q = matrix_D;

        $display("\ndirection: %b\ngoal: %b\nmatrix_Q:\n%p\n%p\n%p\n%p\nW: %b - L: %b\n",
				direction, goal,
				matrix_Q[3][3:0],   matrix_Q[2][3:0],
				matrix_Q[1][3:0],   matrix_Q[0][3:0],
				wl[1], wl[0]);

        #40
        buttons = 0;
        #40

        $display("\ndirection: %b\ngoal: %b\nmatrix_Q:\n%p\n%p\n%p\n%p\nW: %b - L: %b\n",
				direction, goal,
				matrix_Q[3][3:0],   matrix_Q[2][3:0],
				matrix_Q[1][3:0],   matrix_Q[0][3:0],
				wl[1], wl[0]);

        #40;

    end
	
	initial
	#1000 $finish;

endmodule

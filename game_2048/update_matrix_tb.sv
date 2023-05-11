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
    
    
    logic [11:0] temp_matrix [3:0][3:0]; 

    update_matrix_2 uut (clk, Q, goal, direction, buttons, matrix_Q,
                       matrix_D, wl);
	
    initial begin
		$display("Inicia sistema");

    $monitor("\nGoal: %b\nDirection: %b\n",   goal, direction,
             "matrix_Q:\n%p\n%p\n%p\n%p\n", matrix_Q[3][3:0], matrix_Q[2][3:0],
											                      matrix_Q[1][3:0], matrix_Q[0][3:0],
			 		   "matrix_D:\n%p\n%p\n%p\n%p\n", matrix_D[3][3:0], matrix_D[2][3:0],
												  	 	              matrix_D[1][3:0], matrix_D[0][3:0],
			 		   "W: %b - L: %b\n\n\n", wl[1], wl[0]);

		clk = 0;
		Q = 3'b000;
    goal = 4'b0000;
		direction = 4'b0000;
    buttons = 0;
		matrix_Q = '{'{12'd0, 12'd0, 12'd0, 12'd0},
				         '{12'd0, 12'd0, 12'd0, 12'd0},
				         '{12'd0, 12'd0, 12'd0, 12'd0},
				         '{12'd0, 12'd0, 12'd0, 12'd0}};
	end

    always begin
		#10 clk = !clk;
        //sel_mux = uut.sel;
        en_check = uut.en_check;
        //en_game_logic = uut.en_game_logic;

    end

    initial begin

        #30
        
        Q = 3'b010;
        goal = 4'b0100;
        direction = 4'b0100;
        buttons = 1;
        matrix_Q = '{'{12'd2, 12'd0, 12'd2, 12'd16},
                     '{12'd2, 12'd2, 12'd2, 12'd16},
                     '{12'd8, 12'd8, 12'd2,  12'd16},
                     '{12'd4, 12'd8, 12'd2,  12'd16}};

        #180
        temp_matrix = matrix_D;
        #20
        buttons = 0;
        #40



        Q = 3'b010;
        goal = 4'b0100;
        direction = 4'b0100;
        buttons = 1;

        matrix_Q = temp_matrix;

        #200
        buttons = 0;
        #40

        

        #40;

    end
	
	initial
	#1000 $finish;

endmodule

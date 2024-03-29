module game_logic_tb();

    //logic 		 clk, rst;
	logic 		 enable;
	logic [3:0]  rand_pos;
	logic [3:0]  direction;
	logic [11:0] matrix   [3:0][3:0];
	logic [11:0] matrix_D [3:0][3:0];
	logic 		 ready;
	
    //logic [1:0]  Q;
	//logic [1:0]  D;
	logic 		 M;
	logic 		 S; 
	logic		 F;
	logic        isE;
	logic        sE;
    logic        fsE;
	logic		 ntE;

	logic [11:0] assert_matrix   [3:0][3:0];

    game_logic_3 uut (/*clk, rst,*/ enable, rand_pos, direction,
					  matrix, matrix_D, ready);


    initial begin
		$display("Inicia sistema");
		
        $monitor("Direction: %b\n", direction,
				"uut.matrix:\n%p\n%p\n%p\n%p\n",	    uut.matrix[3][3:0], uut.matrix[2][3:0],
												  	    uut.matrix[1][3:0], uut.matrix[0][3:0],
				"uut.moved_matrix:\n%p\n%p\n%p\n%p\n",  uut.moved_matrix[3][3:0], uut.moved_matrix[2][3:0],
													    uut.moved_matrix[1][3:0], uut.moved_matrix[0][3:0],
				"uut.summed_matrix:\n%p\n%p\n%p\n%p\n", uut.summed_matrix[3][3:0], uut.summed_matrix[2][3:0],
													    uut.summed_matrix[1][3:0], uut.summed_matrix[0][3:0],
				"uut.moved_again_matrix:\n%p\n%p\n%p\n%p\n", uut.moved_again_matrix[3][3:0], uut.moved_again_matrix[2][3:0],
													         uut.moved_again_matrix[1][3:0], uut.moved_again_matrix[0][3:0],
				"matrix_D:\n%p\n%p\n%p\n%p", 		      uut.matrix_D[3][3:0], uut.matrix_D[2][3:0],
											 		      uut.matrix_D[1][3:0], uut.matrix_D[0][3:0]);
				//"Ready: %b\n\n\n\n", ready);

					
		enable = 0;
		rand_pos = 4'b0000;
		direction = 4'b0000;
		matrix = '{'{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0}};
	end

	// always begin
	// 	//#10 clk = !clk;
    //     //Q   = uut.Q;
	// 	//D   = uut.D;
	// 	M   = uut.M;
	// 	S   = uut.S;
	// 	F   = uut.F;
    //     isE = uut.initial_shift.enable;
	// 	sE  = uut.sum.enable;
	// 	fsE = uut.final_shift.enable;
	// 	ntE = uut.new_tile.enable;
    // end
		
	initial begin

        #20
		enable = 1;
        rand_pos = 4'b0000;
		direction = 4'b0001;
        matrix = '{'{12'd2,   12'd0,   12'd0,   12'd0},
				   '{12'd4,   12'd4, 12'd128, 12'd128},
				   '{12'd8,   12'd0,   12'd8,   12'd0},
				   '{12'd16, 12'd16,   12'd0,   12'd2}};
        

        #60

		

		assert_matrix = '{'{12'd0, 12'd0,  12'd0,   12'd2},
						  '{12'd0, 12'd0,  12'd8, 12'd256},
						  '{12'd0, 12'd0,  12'd0,  12'd16},
						  '{12'd0, 12'd0, 12'd32,   12'd2}};

		assert((matrix_D === assert_matrix) & (ready === 1)) else $error("Failed");
		
		#40
    	enable = 0;

		#60;
		
	end
	
	initial
	#1000 $finish;

endmodule

module game_logic_tb();

    logic 		 clk, rst, enable;
	logic [3:0]  direction;
	logic [11:0] matrix   [3:0][3:0];
	logic [11:0] matrix_D [3:0][3:0];
	logic 		 ready;
	
    logic [1:0]  Q;
	logic [1:0]  D;
	logic 		 isR;
	logic 		 sR; 
	logic 		 fsR;
	logic        isE;
	logic        sE;
    logic        fsE;

    game_logic_2 uut (clk, rst, enable, direction,
					  matrix, matrix_D, ready);


    initial begin
		$display("Inicia sistema");
		
        $monitor("Current State: %b\n", Q,
				"uut.matrix_Q:\n%p\n%p\n%p\n%p\n",	    uut.matrix_Q[3][3:0], uut.matrix_Q[2][3:0],
												  	    uut.matrix_Q[1][3:0], uut.matrix_Q[0][3:0],
				"uut.moved_matrix:\n%p\n%p\n%p\n%p\n",  uut.moved_matrix[3][3:0], uut.moved_matrix[2][3:0],
													    uut.moved_matrix[1][3:0], uut.moved_matrix[0][3:0],
				"uut.summed_matrix:\n%p\n%p\n%p\n%p\n", uut.summed_matrix[3][3:0], uut.summed_matrix[2][3:0],
													    uut.summed_matrix[1][3:0], uut.summed_matrix[0][3:0],
				"uut.final_matrix:\n%p\n%p\n%p\n%p\n",  uut.final_matrix[3][3:0], uut.final_matrix[2][3:0],
													    uut.final_matrix[1][3:0], uut.final_matrix[0][3:0],
				"matrix_D:\n%p\n%p\n%p\n%p", 		    uut.matrix_D[3][3:0], uut.matrix_D[2][3:0],
											 		    uut.matrix_D[1][3:0], uut.matrix_D[0][3:0]);

					
					
					
					
					
					
		
		clk = 0;
		rst = 0;
		enable = 0;
        ready = 0;
		direction = 4'b0000;
		matrix = '{'{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0}};
	end

	always begin
		#10 clk = !clk;
        Q   = uut.Q;
		D   = uut.D;
		isR = uut.initial_shift.ready;
		sR  = uut.sum.ready;
		fsR = uut.final_shift.ready;
        isE = uut.initial_shift.enable;
		sE  = uut.sum.enable;
		fsE = uut.final_shift.enable;

    end
		
	initial begin

		#40 rst = 1;
		#20 rst = 0;
        #20
        

        matrix = '{'{12'd2, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd4, 12'd128, 12'd128},
				   '{12'd8, 12'd0, 12'd8, 12'd0},
				   '{12'd16, 12'd16, 12'd0, 12'd2}};
        #40

        direction = 4'b0001;
        #40

        enable = 1;

        
        #200
        /*
		$display("direction: %b\nready: %b\nmatrix:\n%p\n%p\n%p\n%p\nmatrix_D:\n%p\n%p\n%p\n%p",
				direction, ready,
				matrix[3][3:0],   matrix[2][3:0],
				matrix[1][3:0],   matrix[0][3:0],
				matrix_D[3][3:0], matrix_D[2][3:0],
				matrix_D[1][3:0], matrix_D[0][3:0]);*/

		#100/*
		$display("Current State: %b\nmatrix_test_bench:\n%p\n%p\n%p\n%p",
				  Q,
				  matrix_D[3][3:0],   matrix_D[2][3:0],
				  matrix_D[1][3:0],   matrix_D[0][3:0]);*/
		#10
    	enable = 0;
		#100
		rst = 1;
		#20
		rst = 0;/*

		#20
        

        matrix = '{'{ 12'd2, 12'd128,   12'd32,  12'd2},
				   '{ 12'd4,   12'd8,  12'd128, 12'd64},
				   '{ 12'd8, 12'd512,    12'd8,  12'd2},
				   '{12'd64,  12'd16, 12'd1024, 12'd32}};
        #40

        direction = 4'b0010;
        #40

        enable = 1;

        
        #200
        
		$display("direction: %b\nready: %b\nmatrix:\n%p\n%p\n%p\n%p\nmatrix_D:\n%p\n%p\n%p\n%p",
				direction, ready,
				matrix[3][3:0],   matrix[2][3:0],
				matrix[1][3:0],   matrix[0][3:0],
				matrix_D[3][3:0], matrix_D[2][3:0],
				matrix_D[1][3:0], matrix_D[0][3:0]);

		#100
    	enable = 0;
		#100
		rst = 1;
		#20
		rst = 0;*/
		
	end
	
	initial
	#1200 $finish;

endmodule

module game_logic_tb();

    logic 		 clk, rst, enable;
	logic [3:0]  goal;
	logic [3:0]  direction;
	logic [11:0] matrix   [3:0][3:0];
	logic [11:0] matrix_D [3:0][3:0];
	logic [1:0]  wl;
	
    logic [1:0]  Q;
    logic        M;
    logic        sME;
    logic [1:0]  sQ;
    logic        S;

    game_logic uut (clk, rst, enable, goal, direction, matrix, matrix_D, wl);


    initial begin
		$display("Inicia sistema");
		/*
        $monitor("direction: %b\ngoal: %b\nmatrix:\n%p\n%p\n%p\n%p\nuut.moved_matrix:\n%p\n%p\n%p\n%p\nuut.summed_matrix:\n%p\n%p\n%p\n%p\nmatrix_D:\n%p\n%p\n%p\n%p",
					uut.direction, uut.goal,
					matrix[3][3:0],   matrix[2][3:0],
					matrix[1][3:0],   matrix[0][3:0],
					uut.moved_matrix[3][3:0], uut.moved_matrix[2][3:0],
					uut.moved_matrix[1][3:0], uut.moved_matrix[0][3:0],
					uut.summed_matrix[3][3:0], uut.summed_matrix[2][3:0],
					uut.summed_matrix[1][3:0], uut.summed_matrix[0][3:0],
					uut.matrix_D[3][3:0], uut.matrix_D[2][3:0],
					uut.matrix_D[1][3:0], uut.matrix_D[0][3:0]);
		*/
		clk = 0;
		rst = 0;
		enable = 0;
        goal = 0;
		direction = 4'b0000;
		matrix = '{'{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0},
				   '{12'd0, 12'd0, 12'd0, 12'd0}};
	end

	always begin
		#10 clk = !clk;
        Q = uut.Q;
        M = uut.M;
        sME = uut.sum.module_enable;
        sQ = uut.sum.Q;
        S = uut.S;
    end
		
	initial begin

		#40 rst = 1;
		#20 rst = 0;
        #20
        
        goal = 4'b0110; #40

        matrix = '{'{12'd2, 12'd0, 12'd0, 12'd0},
				   '{12'd4, 12'd4, 12'd128, 12'd128},
				   '{12'd8, 12'd0, 12'd8, 12'd0},
				   '{12'd16, 12'd16, 12'd0, 12'd2}};
        #40

        direction = 4'b0001;
        #40

        enable = 1;

        
        #200
        
		$display("direction: %b\ngoal: %b\nmatrix:\n%p\n%p\n%p\n%p\nmatrix_D:\n%p\n%p\n%p\n%p\nW: %b - L: %b",
				direction, goal,
				matrix[3][3:0],   matrix[2][3:0],
				matrix[1][3:0],   matrix[0][3:0],
				matrix_D[3][3:0], matrix_D[2][3:0],
				matrix_D[1][3:0], matrix_D[0][3:0],
				wl[1], wl[0]);

		#100
    	enable = 0;
		#100
		rst = 1;
		#20
		rst = 0;

		#20
        
        goal = 4'b1001; #40

        matrix = '{'{ 12'd2, 12'd128,   12'd32,  12'd2},
				   '{ 12'd4,   12'd8,  12'd128, 12'd64},
				   '{ 12'd8, 12'd512,    12'd8,  12'd2},
				   '{12'd64,  12'd16, 12'd1024, 12'd32}};
        #40

        direction = 4'b0010;
        #40

        enable = 1;

        
        #200
        
		$display("direction: %b\ngoal: %b\nmatrix:\n%p\n%p\n%p\n%p\nmatrix_D:\n%p\n%p\n%p\n%p\nW: %b - L: %b",
				direction, goal,
				matrix[3][3:0],   matrix[2][3:0],
				matrix[1][3:0],   matrix[0][3:0],
				matrix_D[3][3:0], matrix_D[2][3:0],
				matrix_D[1][3:0], matrix_D[0][3:0],
				wl[1], wl[0]);

		#100
    	enable = 0;
		#100
		rst = 1;
		#20
		rst = 0;
		
	end
	
	initial
	#1200 $finish;

endmodule

module new_tile_gen_tb();

    logic clk;
    logic [3:0]  Q;
    logic [3:0]  rand_pos;
    logic [11:0] matrix_Q [3:0][3:0];
    logic [11:0] matrix_D [3:0][3:0];

    logic [3:0]  zeros;
    logic [3:0]  new_pos;
    logic [11:0] temp_matrix [3:0][3:0]; 

    new_tile_gen uut (/*clk,*/ Q, rand_pos, matrix_Q, matrix_D); 

    initial begin
		$display("Inicia sistema");

        $monitor("matrix_Q:\n%p\n%p\n%p\n%p\n", matrix_Q[3][3:0], matrix_Q[2][3:0],
											    matrix_Q[1][3:0], matrix_Q[0][3:0],
                 "matrix_D:\n%p\n%p\n%p\n%p\n", matrix_D[3][3:0], matrix_D[2][3:0],
												matrix_D[1][3:0], matrix_D[0][3:0]);
        
		Q = 3'b000;
		rand_pos = 4'b0000;
		matrix_Q = '{ '{12'd0, 12'd0, 12'd0, 12'd0},
				      '{12'd0, 12'd0, 12'd0, 12'd0},
				      '{12'd0, 12'd0, 12'd0, 12'd0},
				      '{12'd0, 12'd0, 12'd0, 12'd0}};

        zeros = 4'b0000;
        new_pos = 4'b0000;
	end

    always begin
        #10 clk = !clk;
        zeros = uut.zeros;
        new_pos = uut.new_pos;
    end

    initial begin
		
		#40
		Q = 3'b011;

        rand_pos = 4'b0010;

        matrix_Q = '{ '{12'd0, 12'd0, 12'd0, 12'd0},
				      '{12'd2, 12'd0, 12'd0, 12'd0},
				      '{12'd0, 12'd0, 12'd2, 12'd0},
				      '{12'd0, 12'd0, 12'd0, 12'd0}};

        #30
        temp_matrix = matrix_D;
        #10

        Q = 3'b000;

        #40
		Q = 3'b011;

        rand_pos = 4'b0101;

        matrix_Q = temp_matrix;


        #30
        temp_matrix = matrix_D;
        #10

        Q = 3'b000;

        #40
		Q = 3'b011;

        rand_pos = 4'b0101;

        matrix_Q = temp_matrix;

        
        
		#100;

    end

    initial
	#1000 $finish;

endmodule

module new_tile_gen(
		//input  logic 		clk,
		input  logic [2:0]	Q,
		input  logic [3:0]  rand_pos,
		input  logic [11:0] matrix_Q [3:0][3:0],
		output logic [11:0] matrix_D [3:0][3:0]
	);

	logic [3:0] zeros, new_pos;

	logic [11:0] temp_matrix_Q [3:0][3:0];

	//logic en_start;
	
	assign en_start = Q[2] | Q[1] | Q[0] ;

	always_comb begin

		if (~Q[2] & ~Q[1] & ~Q[0]) begin
			temp_matrix_Q = '{ '{12'd0, 12'd0, 12'd0, 12'd0},
				    '{12'd0, 12'd0, 12'd0, 12'd0},
				    '{12'd0, 12'd0, 12'd0, 12'd0},
				    '{12'd0, 12'd0, 12'd0, 12'd0}};
		end else begin
			temp_matrix_Q = matrix_Q;
		end
			 
	end

	count_zeros zeros_cnt (temp_matrix_Q, zeros);
	assign new_pos = rand_pos % zeros;

	new_tile n_tile (/*clk,*/ en_start, temp_matrix_Q, new_pos, matrix_D);


endmodule

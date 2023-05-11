module game_logic_3 (/*clk, rst,*/ enable, rand_pos, direction, matrix, matrix_D, ready);

    input  logic        enable;
	input  logic [3:0]  rand_pos;
	input  logic [3:0]  direction;
	input  logic [11:0] matrix   [3:0][3:0];
	output logic [11:0] matrix_D [3:0][3:0];
    output logic        ready;

    logic [11:0] moved_matrix   	[3:0][3:0];
	logic [11:0] summed_matrix  	[3:0][3:0];
	logic [11:0] moved_again_matrix [3:0][3:0];

    logic M; // Flag del primer movimiento
	logic S; // Flag de la suma
	logic F; // Flag del acomodo final 

    // Movement
	movement initial_shift (.enable(enable),
                            .direction(direction),
							.matrix(matrix), 
							.moved_matrix(moved_matrix), 
							.ready(M));

	// Summation
	summation sum 		   (.enable(enable),
                            .direction(direction),
							.matrix(moved_matrix),
							.summed_matrix(summed_matrix), 
							.ready(S));

	// Movement after Summation
	movement final_shift   (.enable(enable),
                            .direction(direction),
						    .matrix(summed_matrix),
						    .moved_matrix(moved_again_matrix), 
						    .ready(F));

	new_tile_gen new_tile  (.enable(enable),
                            .rand_pos(rand_pos),
						    .matrix_Q(moved_again_matrix),
						    .matrix_D(matrix_D));

    assign ready = M & S & F;


endmodule

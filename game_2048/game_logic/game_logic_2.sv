/*
FSM for game's logic
*/
module game_logic_2 (clk, rst, enable, rand_pos, direction, matrix, matrix_D, ready);

	input  logic 		clk, rst, enable;
	input  logic [3:0]  rand_pos;
	input  logic [3:0]  direction;
	input  logic [11:0] matrix   [3:0][3:0];
	output logic [11:0] matrix_D [3:0][3:0];
	output logic 		ready;

	logic [1:0] D;
	logic [1:0] Q;
	
	logic [11:0] matrix_Q [3:0][3:0];
		
	logic M; // Flag del primer movimiento
	logic S; // Flag de la suma
	logic F; // Flag del acomodo final
	
	logic [11:0] moved_matrix   	[3:0][3:0];
	logic [11:0] summed_matrix  	[3:0][3:0];
	logic [11:0] moved_again_matrix [3:0][3:0];
	logic [11:0] new_tile_matrix    [3:0][3:0];
	logic [11:0] mux_matrix     	[3:0][3:0];

	/*
	assign full_matrix = '{'{12'd2048, 12'd2048, 12'd2048, 12'd2048},
				           '{12'd2048, 12'd2048, 12'd2048, 12'd2048},
				   		   '{12'd2048, 12'd2048, 12'd2048, 12'd2048},
				   		   '{12'd2048, 12'd2048, 12'd2048, 12'd2048}};
	*/
	
	/* Current State */
	current_state_logic current_state (.clk(clk),
									   .rst(rst),
									   .enable(enable),
									   .initial_matrix(matrix),
									   .D(D),
									   .matrix_D(matrix_D),
									   .Q(Q),
									   .matrix_Q(matrix_Q));
	
	/* Next State */
	next_state_logic 	next_state    (.clk(clk),
									   .enable(enable),
									   .Q(Q),
									   .M(M),
									   .S(S),
									   .F(F),
									   .D(D));


	// Movement
	movement initial_shift (//.clk(clk),
							.enable((!Q[1] & !Q[0])),
							.direction(direction),
							.matrix(matrix), 
							.moved_matrix(moved_matrix), 
							.ready(M));

	// Summation
	summation sum 		   (//.clk(clk),
							.enable((!Q[1] & Q[0])),
							.direction(direction),
							.matrix(matrix_Q),
							.summed_matrix(summed_matrix), 
							.ready(S));

	// Movement after Summation
	movement final_shift   (//.clk(clk),
						    .enable((Q[1] & !Q[0])),
						    .direction(direction),
						    .matrix(matrix_Q),
						    .moved_matrix(moved_again_matrix), 
						    .ready(F));

	new_tile_gen new_tile  (.clk(clk),
						    .enable((Q[1] & Q[0])),
						    .rand_pos(position),
						    .matrix_Q(matrix_Q),
						    .matrix_D(new_tile_matrix));   


	/* Outputs */
	mux_4MtoM m4MtoM (.M0(moved_matrix),
					  .M1(summed_matrix),
					  .M2(moved_again_matrix),
					  .M3(new_tile_matrix),
					  .S(Q),
					  .OM(matrix_D));

	// El flag ready es 1 cuando este en el estado 11 (new_tile)
	assign ready = !Q[1] & !Q[0]; //& (M & F & S);


endmodule

/*
Next State for Game Logic FSM
*/
module next_state_logic(Q, M, S, D);

	input  logic [1:0] Q;
	input  logic 		 M;
	input  logic 		 S;
	output logic [1:0] D;
	
	
	// FALTA

	
	assign D[1] = Q[1];
	assign D[0] = Q[0];


endmodule

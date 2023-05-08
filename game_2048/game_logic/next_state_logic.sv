/*
Next State for Game Logic FSM
*/
module next_state_logic(Q, M, S, D);

	input  logic [1:0] Q;
	input  logic 	   M;
	input  logic 	   S;
	output logic [1:0] D;

	
	assign D[1] = Q[1] | (Q[0] & !M & !S);
	assign D[0] = (Q[1] & !M & !S) | (Q[1] & !Q[0] & !S) | (Q[1] & !Q[0] & M);


endmodule

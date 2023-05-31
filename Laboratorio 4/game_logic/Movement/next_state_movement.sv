/*
Next State for Movement's FSM
*/
module next_state_movement(Q, r, D);

	input  logic [1:0] Q;
	input  logic 	   r;
	output logic [1:0] D;

	assign D[0] = (!Q[0] & !r) | (Q[0] & r) | (Q[1] & !r);
	assign D[1] = Q[1] | (Q[0] & !r);

endmodule

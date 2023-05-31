/*
Next State for Summation FSM
*/
module next_state_summation (Q, r, D);

	input  logic [1:0] Q;
	input  logic 	   r;
	output logic [1:0] D;

	assign D[1] = r | Q[0] | Q[1];
    assign D[0] = !Q[1] & !Q[0] & !r;

endmodule

/*
Outputs for Movement's FSM
*/

module outputs_movement(Q, ms);

	input  logic [1:0] Q;
	output logic [1:0] ms;

	assign ms[0] = Q[0];
	assign ms[1] = Q[1];

endmodule

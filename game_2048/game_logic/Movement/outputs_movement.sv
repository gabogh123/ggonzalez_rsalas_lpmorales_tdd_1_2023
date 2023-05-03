/*
Outputs for Movement's FSM
*/

module outputs_movement(input Q2, Q1, Q0, output M1, M0);

	assign M0 = Q0;
	assign M1 = Q1;

endmodule

/*
Next State for Movement's FSM
*/
module next_state_movement(input Q2, Q1, Q0, r, output D2, D1, D0);

	assign D0 = !Q0 & !r;
	assign D1 = (Q0 & !r) | (Q1 & !r) | (Q1 & Q0);
	assign D2 = (!Q2 & !Q1 & r) | (!Q2 & !Q0 & r);

endmodule

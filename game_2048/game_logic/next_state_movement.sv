/*
Next State
*/
module next_state_movement(input Q2, Q1, Q0, r, output D2, D1, D0);

// FALTA

assign D0 = !Q1 & r;
assign D1 = Q0 ^ Q1;
assign D2 = Q2;

endmodule

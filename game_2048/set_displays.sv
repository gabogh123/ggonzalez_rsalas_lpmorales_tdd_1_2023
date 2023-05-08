module set_displays(
		input logic [2:0] Q,
		input logic [3:0] switches,
		input logic [11:0] matrix [3:0][3:0],
		output logic [0:6] disp_0, disp_1, disp_2, disp_3
	);

	logic [11:0] score, w_score_0, w_score_1;
	logic sel;
	
	assign sel = ~Q[2] & ~Q[1] & Q[0];

	switches_deco switches_deco(switches, w_score_0);

	assign w_score_1 = 12'd0;

	assign score = sel ? w_score_0 : w_score_1;

	score_deco score_deco(score, disp_0, disp_1, disp_2, disp_3);

endmodule

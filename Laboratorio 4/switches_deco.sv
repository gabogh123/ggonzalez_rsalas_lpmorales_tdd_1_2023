module switches_deco(
		input logic [3:0] switches,
		output logic [11:0] goal
	);

	always_comb
        case (switches)
            4'd0:  goal = 12'd4;
            4'd1:  goal = 12'd8;
            4'd2:  goal = 12'd16;
            4'd3:  goal = 12'd32;
            4'd4:  goal = 12'd64;
            4'd5:  goal = 12'd128;
            4'd6:  goal = 12'd256;
            4'd7:  goal = 12'd512;
            4'd8:  goal = 12'd1024;
            4'd9:  goal = 12'd2048;
            default: goal = 12'd2048;
        endcase

endmodule

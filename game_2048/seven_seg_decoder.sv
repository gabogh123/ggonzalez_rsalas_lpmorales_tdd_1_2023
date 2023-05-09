module seven_seg_decoder(
		input logic [3:0] data,
		output logic [0:6] segments
	);
								 
	always_comb
		case (data)
			'h0:			segments = 7'b000_0001;
			'h1:			segments = 7'b100_1111;
			'h2:			segments = 7'b001_0010;
			'h3:			segments = 7'b000_0110;
			'h4:			segments = 7'b100_1100;
			'h5:			segments = 7'b010_0100;
			'h6:			segments = 7'b010_0000;
			'h7:			segments = 7'b000_1111;
			'h8:			segments = 7'b000_0000;
			'h9:			segments = 7'b000_1100;
			default: segments = 7'b111_1111;
		endcase
endmodule

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
			'hA:			segments = 7'b000_1000;
			'hB:			segments = 7'b110_0000;
			'hC:			segments = 7'b011_0001;
			'hD:			segments = 7'b100_0010;
			'hE:			segments = 7'b011_0000;
			'hF:			segments = 7'b011_1000;
			default: segments = 7'b111_1111;
		endcase
endmodule

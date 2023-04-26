module video_gen(input logic [9:0] x, y, output logic [7:0] r, g, b);
	logic pixel, in_grid, active_pixel;
	//rectgen rectgen(x, y, 10'd120, 10'd150, 10'd200, 10'd230, inrect);

	//start_text start_text(x, y, pixel);
	// defeat_text defeat_text(x, y, pixel);
	//victory_text victory_text(x, y, pixel);

	// logic [11:0] matrix [3:0][3:0]= '{'{12'd2, 12'd4, 12'd8, 12'd16}, 
	// 							  '{12'd32, 12'd64, 12'd128, 12'd256},
	// 							  '{12'd512, 12'd1024, 12'd2048, 12'd0},
	// 							  '{12'd0, 12'd2, 12'd0, 12'd4}};
	logic [11:0] matrix [3:0][3:0]= '{'{12'd4, 12'd16, 12'd0, 12'd0}, 
								  '{12'd2, 12'd0, 12'd0, 12'd0},
								  '{12'd0, 12'd0, 12'd0, 12'd0},
								  '{12'd2, 12'd0, 12'd0, 12'd0}};
	display_matrix disp_matrix(x, y, matrix, pixel);
	display_grid grid(x, y, in_grid);
	
	// assign {r, b} = (y[3]==0) ? {{8{pixel}},8'h00} : {8'h00,{8{pixel}}};
	// assign g = inrect ? 8'hFF : 8'h00;
	assign {r, g, b} = pixel ? {{8{pixel}}, 8'h00, 8'h00} : {{8{in_grid}}, {8{in_grid}}, {8{in_grid}}};
endmodule

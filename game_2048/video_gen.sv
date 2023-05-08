module video_gen(
		input logic [9:0] x, y,
		input logic [2:0] state,
		input logic [11:0] matrix [3:0][3:0],  
		output logic [7:0] r, g, b
	);
	logic pixel_0, pixel_1, pixel_2, pixel_3, in_grid_temp, in_grid, pixel;


	start_text start_text(x, y, pixel_0);

	display_matrix disp_matrix(x, y, matrix, pixel_1);
	display_grid grid(x, y, in_grid_temp);

	victory_text victory_text(x, y, pixel_2);

	defeat_text defeat_text(x, y, pixel_3);

	always @(state) begin
		case (state)
			3'b000: begin 
				pixel = pixel_0;
				in_grid = 0; 
			end 
			3'b001: begin 
				pixel = pixel_0;
				in_grid = 0;
			end 
			3'b010: begin 
				pixel = pixel_1;
				in_grid = in_grid_temp;
			end 
			3'b011: begin 
				pixel = pixel_1;
				in_grid = in_grid_temp;
			end  
			3'b100: begin 
				pixel = pixel_2;
				in_grid = 0;
			end
			3'b101: begin 
				pixel = pixel_3;
				in_grid = 0; 
			end
			default: begin 
				pixel = pixel_0;
				in_grid = 0; 
			end
		endcase
	end
	
	assign {r, g, b} = pixel ? {{8{pixel}}, 8'h00, 8'h00} : {{8{in_grid}}, {8{in_grid}}, {8{in_grid}}};
endmodule

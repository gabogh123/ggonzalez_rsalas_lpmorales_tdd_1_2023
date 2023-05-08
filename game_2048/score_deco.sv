module score_deco(
		input logic [11:0] score,
		output logic [0:6] disp_0, disp_1, disp_2, disp_3
	);

	logic [3:0] w_disp_0, w_disp_1, w_disp_2, w_disp_3;

	always_comb begin
		case (score)
			12'd2: begin
				w_disp_0 = 4'd2; 
				w_disp_1 = 4'd0; 
				w_disp_2 = 4'd0; 
				w_disp_3 = 4'd0; 
			end
			12'd4: begin
				w_disp_0 = 4'd4; 
				w_disp_1 = 4'd0; 
				w_disp_2 = 4'd0; 
				w_disp_3 = 4'd0; 
			end
			12'd8: begin
				w_disp_0 = 4'd8; 
				w_disp_1 = 4'd0; 
				w_disp_2 = 4'd0; 
				w_disp_3 = 4'd0; 
			end
			12'd16: begin
				w_disp_0 = 4'd6; 
				w_disp_1 = 4'd1; 
				w_disp_2 = 4'd0; 
				w_disp_3 = 4'd0; 
			end
			12'd32: begin
				w_disp_0 = 4'd2; 
				w_disp_1 = 4'd3; 
				w_disp_2 = 4'd0; 
				w_disp_3 = 4'd0; 
			end
			12'd64: begin
				w_disp_0 = 4'd4; 
				w_disp_1 = 4'd6; 
				w_disp_2 = 4'd0; 
				w_disp_3 = 4'd0; 
			end
			12'd128: begin
				w_disp_0 = 4'd8; 
				w_disp_1 = 4'd2; 
				w_disp_2 = 4'd1; 
				w_disp_3 = 4'd0; 
			end
			12'd256: begin
				w_disp_0 = 4'd6; 
				w_disp_1 = 4'd5; 
				w_disp_2 = 4'd2; 
				w_disp_3 = 4'd0; 
			end
			12'd512: begin
				w_disp_0 = 4'd2; 
				w_disp_1 = 4'd1; 
				w_disp_2 = 4'd5; 
				w_disp_3 = 4'd0; 
			end
			12'd1024: begin
				w_disp_0 = 4'd4; 
				w_disp_1 = 4'd2; 
				w_disp_2 = 4'd0; 
				w_disp_3 = 4'd1; 
			end
			12'd2048: begin
				w_disp_0 = 4'd8; 
				w_disp_1 = 4'd4; 
				w_disp_2 = 4'd0; 
				w_disp_3 = 4'd2; 
			end  
			default: begin
				w_disp_0 = 4'd0; 
				w_disp_1 = 4'd0; 
				w_disp_2 = 4'd0; 
				w_disp_3 = 4'd0; 
			end 
		endcase
	end

seven_seg_decoder deco_disp0(w_disp_0, disp_0);
seven_seg_decoder deco_disp1(w_disp_1, disp_1);
seven_seg_decoder deco_disp2(w_disp_2, disp_2);
seven_seg_decoder deco_disp3(w_disp_3, disp_3);

endmodule
/*
MUX 2:1
*/

module mux_2MtoM(clk, M0, M1, S, OM);
	  
	input  logic        clk;  
	input  logic [11:0] M0 		 [3:0][3:0];
	input  logic [11:0] M1 		 [3:0][3:0];
	input  logic        S; 
	output logic [11:0] OM 		 [3:0][3:0];
	
	always_ff @ (posedge clk) begin

		for (int i = 0; i < 4; i++) begin
			for (int j = 0; j < 4; j++) begin
				for (int k = 0; k < 12; k++) begin
					OM[i][j][k] = (M0[i][j][k] & ~S) | (M1[i][j][k] & S);
				end
			end
		end

	end
	  
endmodule

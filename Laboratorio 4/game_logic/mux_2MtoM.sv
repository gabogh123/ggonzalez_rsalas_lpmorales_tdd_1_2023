/*
MUX 2:1
*/

module mux_2MtoM(M0, M1, S, OM);
	  
	input  logic [11:0] M0 		 [3:0][3:0];
	input  logic [11:0] M1 		 [3:0][3:0];
	input  logic        S; 
	output logic [11:0] OM 		 [3:0][3:0];
	
	//always_ff @ (posedge clk) begin // clk) begin

	genvar i, j, k;

	generate

		for (i = 0; i < 4; i++) begin : f1
			for (j = 0; j < 4; j++) begin : f2
				for (k = 0; k < 12; k++) begin : f3
					assign OM[i][j][k] = (M0[i][j][k] & !S) | (M1[i][j][k] & S);
				end
			end
		end

	endgenerate
	  
endmodule

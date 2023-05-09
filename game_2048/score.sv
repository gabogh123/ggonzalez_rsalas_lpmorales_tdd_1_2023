module score(
		input logic [11:0] matrix [3:0][3:0],
		output logic [11:0] score
	);

	logic [11:0] comparations[14:0];
	logic [11:0] linear_mat[15:0];

	greater gt_0 (linear_mat[15], linear_mat[14], comparations[14]);

	genvar i,j,k;
	generate
		for (i = 0; i < 4; i++) begin : rows_loop
			for (j = 0; j < 4; j++) begin : columns_loop
				assign linear_mat[i*4 + j] = matrix[i][j];
			end
		end	
	endgenerate

	generate
		for (k = 14; k > 0; k-- ) begin : comparators
			greater gt_k(comparations[k], linear_mat[k-1], comparations[k-1]);
		end
	endgenerate

	assign score = comparations[0];

endmodule

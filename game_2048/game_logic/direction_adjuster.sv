module direction_adjuster(direction, matrix, adjusted_matrix);

	input  reg [3:0] direction;
	input  reg [11:0] matrix 			[3:0][3:0];
	output reg [11:0] adjusted_matrix [3:0][3:0];

	
	initial begin
	
		$display("\n\ndirection: %b", direction);
		
		/*
		Se acomodara la matriz para hacer los movimientos correspondientes con
		los casos propuestos para una matriz que se mueve hacia abajo:
		*/
		
		$display("\nmatrix:");
		for (int i = 3; i > -1; i--) begin
			$display("%p", matrix[i][3:0]);
		end
		
		/*
		Como la matriz se quiere mover hacia la izquierda,
		su lado izquierdo ahora es la fila de mas abajo
		*/
		if (direction == 4'b1000) begin // LEFT
			
			for (int i = 0; i < $size(matrix); i++) begin
				for (int j = 0; j < $size(matrix); j++) begin
					adjusted_matrix[i][j] = matrix[j][3-i];
				end
			end
			
			
		/*
		Como la matriz se quiere mover hacia abajo,
		la matriz queda como estaba
		*/
		end else if (direction == 4'b0100) begin // DOWN
		
			adjusted_matrix = matrix;

			
		/*
		Como la matriz se quiere mover hacia arriba,
		su lado de arriba ahora es la fila de mas abajo
		*/
		end else if (direction == 4'b0010) begin // UP
		
			for (int i = 0; i < $size(matrix); i++) begin
				for (int j = 0; j < $size(matrix); j++) begin
					adjusted_matrix[i][j] = matrix[3-i][j];
				end
			end
			
			
		/*
		Como la matriz se quiere mover hacia la derecha,
		su lado derecho ahora es la fila de mas abajo
		*/
		end else if (direction == 4'b0001) begin // right
		
			for (int i = 0; i < $size(matrix); i++) begin
				for (int j = 0; j < $size(matrix); j++) begin
					adjusted_matrix[i][j] = matrix[3-j][i];
				end
			end
			
		
		end else begin
			adjusted_matrix = matrix;
		end
		
	
	end
	

endmodule

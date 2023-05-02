module direction_adjuster(direction, matrix, adjusted_matrix);

	input  logic [3:0]  direction;
	input  logic [11:0] matrix 			[3:0][3:0];
	output logic [11:0] adjusted_matrix [3:0][3:0];

	
	initial begin
	
		$display("\n\ndirection @ direction_adjuster: %b", direction);
		
		/*
		Se acomodara la matriz para hacer los movimientos correspondientes con
		los casos propuestos para una matriz que se mueve hacia abajo:
		*/
		
		$display("\nmatrix @ direction_adjuster:");
		for (int i = 3; i > -1; i--) begin
			$display("%p", matrix[i][3:0]);
		end
		
		/*
		Como la matriz se quiere mover hacia la izquierda,
		su lado izquierdo ahora es la fila de mas abajo
		*/
		if (direction == 4'b1000) begin // LEFT
		
			$display("\nLEFT @ direction_adjuster:");
			
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
		
			$display("\nDOWN @ direction_adjuster:");
		
			adjusted_matrix = matrix;

			
		/*
		Como la matriz se quiere mover hacia arriba,
		su lado de arriba ahora es la fila de mas abajo
		*/
		end else if (direction == 4'b0010) begin // UP
		
			$display("\nUP @ direction_adjuster:");
		
			for (int i = 0; i < $size(matrix); i++) begin
				for (int j = 0; j < $size(matrix); j++) begin
					adjusted_matrix[i][j] = matrix[3-i][j];
				end
			end
			
			
		/*
		Como la matriz se quiere mover hacia la derecha,
		su lado derecho ahora es la fila de mas abajo
		*/
		end else if (direction == 4'b0001) begin // RIGHT
		
			$display("\nRIGHT @ direction_adjuster:");
		
			for (int i = 0; i < $size(matrix); i++) begin
				for (int j = 0; j < $size(matrix); j++) begin
					adjusted_matrix[i][j] = matrix[3-j][i];
				end
			end
			
		
		end else begin
			adjusted_matrix = matrix;
		end
		
	
		$display("\nadjusted_matrix @ direction_adjuster:");
		for (int i = 3; i > -1; i--) begin
			$display("%p", adjusted_matrix[i][3:0]);
		end
		
	
	end
	

endmodule

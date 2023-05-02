/*

Modulo de Movimiento

input:
	- matriz con los valores existentes por mover
	- la direccion del movimiento por hacer
	
output:
	- matriz con los movimientos hechos
	- flag para saber si esta lista o se tiene que reacomodar

*/


module movement(direction, matrix, for_sum, moved_matrix, ready);

	input  logic [3:0]  direction;
	input  logic [11:0] matrix 		 [3:0][3:0];
	input  logic 		  for_sum;
	output logic [11:0] moved_matrix [3:0][3:0];
	output logic 		  ready;
	
	logic [11:0] temp_matrix [3:0][3:0];
	
	logic [11:0] adjusted_matrix [3:0][3:0];
	
	
	initial begin
	
		$display("\n\ndirection: %b", direction);
		
	/***********************************************Initial Direction Adjust***********************************************************/
		
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
		
	/***********************************************Initial Direction Adjust***********************************************************/

		
		// Flag para saber si se tiene que volver a acomodar
		ready = 1;
		
		temp_matrix = adjusted_matrix;
		
		
	/***************************************************Matrix Movement***************************************************************/
		
		for (int i = 0; i < 4; i++) begin
			
			for (int j = 0; j < 4; j++) begin
				
				if (temp_matrix[i][j][11:0] != 12'd0) begin // Si hay valor en esa posicion
					
					if (i != 0) begin // Si no esta en la ultima fila
						
						if (temp_matrix[i-1][j][11:0] == 12'd0) begin // Si hay espacio para moverlo
						
							temp_matrix[i-1][j][11:0] = temp_matrix[i][j][11:0];
							temp_matrix[i][j][11:0] = 12'd0;
							
							if (i > 1) begin // Si despues de mover aun tiene espacio para seguir moviendose
							
								if (temp_matrix[i-2][j][11:0] == 12'd0) begin
								
									ready = 0;
							
								end

							end
						
						end
					
					end
				
				end
			
			end
			
		end
		
	/***************************************************Matrix Movement***************************************************************/

	
	/**********************************************Reverse Direction Adjust***********************************************************/
		
		/*
		Se reacomodara la matriz a la direccion inicial que tenia:
		*/
		
		
		/*
		Como la matriz se movio hacia la izquierda,
		su lado de abajo ahora vuelve a ser su lado izquierdo.
		Se hace una rotacion derecha.
		*/
		if (direction == 4'b1000) begin // left		
				
			for (int i = 0; i < $size(temp_matrix); i++) begin
				for (int j = 0; j < $size(temp_matrix); j++) begin
					moved_matrix[i][j] = temp_matrix[3-j][i];
				end
			end
			

		/*
		Como la matriz se movio hacia abajo,
		la matriz queda como estaba.
		*/
		end else if (direction == 4'b0100) begin // down
		
			moved_matrix = temp_matrix;
			
			
		/*
		Como la matriz se movio hacia arriba,
		su lado de abajo ahora es la fila de mas arriba.
		*/
		end else if (direction == 4'b0010) begin // up
		
			for (int i = 0; i < $size(temp_matrix); i++) begin
				for (int j = 0; j < $size(temp_matrix); j++) begin
					moved_matrix[i][j] = temp_matrix[3-i][j];
				end
			end
			
			
		/*
		Como la matriz se movio hacia la derecha,
		su lado de abajo ahora vuelve a ser su lado derecho.
		Se hace una rotacion izquierda.
		*/
		end else if (direction == 4'b0001) begin // right
		
			for (int i = 0; i < $size(temp_matrix); i++) begin
				for (int j = 0; j < $size(temp_matrix); j++) begin
					moved_matrix[i][j] = temp_matrix[j][3-i];
				end
			end
		
		
		end else begin
			moved_matrix = temp_matrix;
		end
		

		$display("\nmoved_matrix:");
		for (int i = 3; i > -1; i--) begin
			
			$display("%p", moved_matrix[i][3:0]);
			
		end
		
	/**********************************************Reverse Direction Adjust***********************************************************/
		
		
		$display("ready: %b", ready);
	
	end


endmodule

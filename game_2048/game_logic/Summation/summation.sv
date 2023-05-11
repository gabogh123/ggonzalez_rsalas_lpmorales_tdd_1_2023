/*
Modulo de suma

input:
	- matriz con los valores existentes por sumar recien movidos
	- la direccion del movimiento hecho
	
output:
	- matriz con las sumas hechas
	- flag para saber si esta lista o se tiene que reacomodar
		(ready sera la variable que entra en for_sum de 'movement' si es igual a 0)
*/
module summation(/*clk,*/ enable, direction, matrix, summed_matrix, ready);

	//input  logic 		clk;
	input  logic 		enable;
	input  logic [3:0]  direction;
	input  logic [11:0] matrix 		  [3:0][3:0];
	output logic [11:0] summed_matrix [3:0][3:0];
	output logic		ready;
	

	logic [11:0] adjusted_matrix [3:0][3:0];
	logic [11:0] temp_matrix [3:0][3:0];
										
	
	// initial begin
	//always_ff @ (posedge clk) begin
	always_comb begin
		
	/***********************************************Initial Direction Adjust***********************************************************/

		if (enable) begin

			/*
			Se acomodara la matriz para hacer los movimientos correspondientes con
			los casos propuestos para una matriz que se mueve hacia abajo:
			*/
			
			
			/*
			Como la matriz se quiere mover hacia la izquierda,
			su lado izquierdo ahora es la fila de mas abajo
			*/
			if (direction == 4'b1000) begin // LEFT
				
				for (int i = 0; i < 4; i++) begin
					for (int j = 0; j < 4; j++) begin
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
		
	/**************************************************Matrix Summations***************************************************************/
			
			for (int i = 0; i < 4; i++) begin
				
				for (int j = 0; j < 4; j++) begin
					
					if (temp_matrix[i][j][11:0] != 12'd0) begin // Si hay valor en esa posicion
						
						if (i != 3) begin // Si no esta en la primera fila
						
							if (temp_matrix[i+1][j][11:0] != 12'd0) begin // Si hay un valor encima
							
								if (temp_matrix[i+1][j][11:0] == temp_matrix[i][j][11:0]) begin // Si el valor encima es igual
							
									temp_matrix[i][j][11:0] = temp_matrix[i][j][11:0] + temp_matrix[i+1][j][11:0]; // Se da la suma en el valor de mas abajo
									temp_matrix[i+1][j][11:0] = 12'd0; // El valor encima queda en cero
							
								end
							
							end
							
						end
							
						if (i != 0) begin // Si no esta en la ultima fila
						
							if (temp_matrix[i-1][j][11:0] == 12'd0) begin // Si hay espacio para moverlo
							
								ready = 0;
							end
						end
					
					end
				
				end
				
			end

		ready = 1; // Ahora es solo para saber que termina
			
	/**************************************************Matrix Summations***************************************************************/

		
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
						summed_matrix[i][j] = temp_matrix[3-j][i];
					end
				end
				

			/*
			Como la matriz se movio hacia abajo,
			la matriz queda como estaba.
			*/
			end else if (direction == 4'b0100) begin // down
			
				summed_matrix = temp_matrix;
				
				
			/*
			Como la matriz se movio hacia arriba,
			su lado de abajo ahora es la fila de mas arriba.
			*/
			end else if (direction == 4'b0010) begin // up
			
				for (int i = 0; i < $size(temp_matrix); i++) begin
					for (int j = 0; j < $size(temp_matrix); j++) begin
						summed_matrix[i][j] = temp_matrix[3-i][j];
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
						summed_matrix[i][j] = temp_matrix[j][3-i];
					end
				end
			
			
			end else begin
				summed_matrix = temp_matrix;
			end

		
	/**********************************************Reverse Direction Adjust***********************************************************/
		end else begin

			ready = 0;
			summed_matrix = matrix;

		end
	
	end

endmodule

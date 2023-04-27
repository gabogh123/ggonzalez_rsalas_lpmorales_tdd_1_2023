/*

Modulo de Movimiento

input:
	- matriz con los valores existentes por mover
	- el tipo de movimiento por hacer
	
output:
	- matriz con los movimientos hechos
	
Se podría hacer que siempre, sea cual sea el instante la matriz pueda
entrar acá y solo se van a correr los valores como deberían.

*/



module movement(direction, matrix, moved_matrix, ready);

	input  logic [3:0] direction;
	input  logic [11:0] matrix 		[3:0][3:0];
	output logic [11:0] moved_matrix [3:0][3:0];
	output logic ready;
	
	logic [11:0] temp_matrix [3:0][3:0];

	
	initial begin
	
	ready = 1;
	
	temp_matrix = matrix;
	
	
	for (int i = 3; i > -1; i--) begin
		
		$display("%p", temp_matrix[i][3:0]);
		
	end
	
	

	for (int i = 0; i < 4; i++) begin
		
		for (int j = 0; j < 4; j++) begin
	
			// $display("%d", matrix[i][j][11:0]);
			
			if (temp_matrix[i][j][11:0] != 12'd0) begin // Si hay valor en esa posicion
			
				$display("not empty: %d", temp_matrix[i][j][11:0]);
				
				if (i != 0) begin // Si no esta en la ultima fila
				
					$display("not last: %d", temp_matrix[i][j][11:0]);
					
					if (temp_matrix[i-1][j][11:0] == 12'd0) begin
					
						$display("mover: %d", temp_matrix[i][j][11:0]);
						temp_matrix[i-1][j][11:0] = temp_matrix[i][j][11:0];
						temp_matrix[i][j][11:0] = 12'd0;
						
						if (i > 2) begin // Si despues de mover aun tiene espacio para seguir moviendose
						
							if (temp_matrix[i-2][j][11:0] == 12'd0) begin
							
								ready = 0;
								$display("hay que reacomodar");
						
							end

						end
					
					end
				
				end
			
			end
		
		end
		
		//$display("%p", temp_matrix[i][3:0]);
		
	end
	
	for (int i = 3; i > -1; i--) begin
		
		$display("%p", temp_matrix[i][3:0]);
		
	end
	
	$display("ready: %b", ready);
	
	end


endmodule

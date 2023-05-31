/*
Verifies if there's any posibility to move the matrix to a specific side
*/
module movement_posibility_by_side(/*clk,*/ enable, direction, matrix, L);

	//input  logic clk;
	input  logic enable;
	input  logic [3:0]  direction;
	input  logic [11:0] matrix [3:0][3:0];
	output logic L;
	
	logic [11:0] adjusted_matrix [3:0][3:0];
	
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
			
			
	/******************************************Movement Posibility Checker by Side*****************************************************/
			
			for (int i = 0; i < 4; i++) begin
				
				for (int j = 0; j < 4; j++) begin
					
					if (adjusted_matrix[i][j][11:0] != 12'd0) begin /* ( 2 ) : value */
						
						if (i != 0) begin /* ( 4 ) : not last row */
						
							if (adjusted_matrix[i-1][j][11:0] == 12'd0) begin /* ( 7 ) : possible movement */
							
								L = 0;
								break;
							
							end else begin /* ( 6 ) : no possible movement */
							
								if (i == 3) begin /* ( 9 ) : first row */
								
									continue;
								
								end else begin /* ( 8 ) : not first row */
								
								/* ( 10 ) : possible summation check */
									
										if (adjusted_matrix[i+1][j][11:0] != 12'd0) begin /* ( 11 ) : upper value */
										
											if (adjusted_matrix[i+1][j][11:0] == adjusted_matrix[i][j][11:0]) begin /* ( 14 ) : possible summation */
											
												L = 0;
												break;
											
											end else begin /* ( 13 ) : no possible summation */
											
												L = 1;
												break;
											
											end
										
										end else begin /* ( 12 ) : no upper value */
										
											L = 0;
											break;
										
										end
										
								/* end */
								
								end
							
							end
						
						end else begin /* ( 5 ) : last row */
						
						/* ( 10 ) : possible summation check */
									
								if (adjusted_matrix[i+1][j][11:0] != 12'd0) begin /* ( 11 ) : upper value */
								
									if (adjusted_matrix[i+1][j][11:0] == adjusted_matrix[i][j][11:0]) begin /* ( 14 ) : possible summation */
									
										L = 0;
										break;
									
									end else begin /* ( 13 ) : no possible summation */
									
										L = 1;
										break;
									
									end
								
								end else begin /* ( 12 ) : no upper value */
								
									L = 0;
									break;
								
								end
								
						/* end */
						
						end
					
					end else begin /* ( 3 ) : no value */
					
						L = 0;
						break;
					
					end
				
				end
				
			end
			
	/******************************************Movement Posibility Checker by Side*****************************************************/
			
		end else begin

			L = 0;

		end

	end
	
endmodule

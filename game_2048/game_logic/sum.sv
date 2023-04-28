/*
Modulo de suma

input:
	- matriz con los valores existentes por sumar
	- la direccion del movimiento por hacer
	
output:
	- matriz con las sumas hechas
	- flag para saber si esta lista o se tiene que reacomodar
		(ready sera la variable que entra en for_sum de 'movement' si es igual a 0)
*/
module sum (direction, matrix, summed_matrix, ready);

	input  logic [3:0] direction;
	input  logic [11:0] matrix 		 [3:0][3:0];
	output logic [11:0] summed_matrix [3:0][3:0];
	output logic ready;
	
	
	
	
endmodule

module mult
	# (parameter M = 4)
	  (A, B, R, C, N, V, Z);
  
	input  logic [M-1:0] A;
	input  logic [M-1:0] B;
	
	output logic [M-1:0] R; // = result, solo que no podría ser: [2*M-1:0]
	output				   C;
	output					N;
	output					V;
	output					Z;

	logic [M-1:0] product [0:M-1];
	logic [2*M-1:0] sum;
   /*
	genvar i, j;
  
	generate
		
	  // Generate partial products
	  for (i = 0; i < M; i++) begin: partial_products_1
		 for (j = 0; j < M; j++) begin: partial_products_2
			assign product[i][j+i] = A[i] & B[j];
		 end
	  end

	  // Generate sum of partial products
	  assign sum = product[0];
	  for (i = 1; i < M; i++) begin: partial_sum_1
		 for (j = 0; j < 2*M-i; j++) begin: partial_sum_2
			assign sum[j+i] = sum[j+i] ^ product[i][j];
		 end
	  end
	  
	  
	  //HICE UN CAMBIO:
	  //Aqui el resultado deberia ser de la misma cantidad de bits que la entrada y salida.
	  //Tal vez si son mas bits podriamos poner el overflow.
	  
	  // Output result = R
	  assign R = sum[M-1:0];
	  
	endgenerate
	*/

endmodule
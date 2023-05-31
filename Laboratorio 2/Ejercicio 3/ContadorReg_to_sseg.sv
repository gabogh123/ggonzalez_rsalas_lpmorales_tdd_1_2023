module ContadorReg_to_sseg(input reset, up_down, 
									output[6:0] sseg_hex5, sseg_hex4, sseg_hex3, sseg_hex2, sseg_hex1, sseg_hex0);

	// Variable que representa el valor actual del contador
	logic [5:0] counter;
									
	// Instancia del contador regresivo
	ContadorReg cont_reg (reset, up_down, counter);
	
	// Instancia del convertidor hex a sseg del 7 signal display HEX5
	hex_to_sseg hex_to_sseg_hex5 ({3'b000, counter[5]}, sseg_hex5);
	
	// Instancia del convertidor hex a sseg del 7 signal display HEX4
	hex_to_sseg hex_to_sseg_hex4 ({3'b000, counter[4]}, sseg_hex4);
	
	// Instancia del convertidor hex a sseg del 7 signal display HEX3
	hex_to_sseg hex_to_sseg_hex3 ({3'b000, counter[3]}, sseg_hex3);
	
	// Instancia del convertidor hex a sseg del 7 signal display HEX2
	hex_to_sseg hex_to_sseg_hex2 ({3'b000, counter[2]}, sseg_hex2);
	
	// Instancia del convertidor hex a sseg del 7 signal display HEX1
	hex_to_sseg hex_to_sseg_hex1 ({3'b000, counter[1]}, sseg_hex1);
	
	// Instancia del convertidor hex a sseg del 7 signal display HEX0
	hex_to_sseg hex_to_sseg_hex0 ({3'b000, counter[0]}, sseg_hex0);
									
endmodule

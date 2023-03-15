
module BCDDecoder_to_sseg(a, b, c, d, sseg_hex4, sseg_hex3, sseg_hex2, sseg_hex1, sseg_hex0);

	input a, b, c, d;

	output [6:0] sseg_hex4;
	output [6:0] sseg_hex3;
	output [6:0] sseg_hex2;
	output [6:0] sseg_hex1;
	output [6:0] sseg_hex0;
	
	logic [4:0] y;// Salida en 5'b
	//assign y = 4'b000;
	
	//always @ (a,b,c,d)
		
		//begin

			// Instancia del decoder
			BCDDecoder bcdd (a, b, c, d, y);
				
			// Instancia del convertidor hex a sseg del 7 signal display HEX4
			hex_to_sseg hex_to_sseg_hex4 ({3'b000, y[4]}, sseg_hex4);
			
			// Instancia del convertidor hex a sseg del 7 signal display HEX3
			hex_to_sseg hex_to_sseg_hex3 ({3'b000, y[3]}, sseg_hex3);
			
			// Instancia del convertidor hex a sseg del 7 signal display HEX2
			hex_to_sseg hex_to_sseg_hex2 ({3'b000, y[2]}, sseg_hex2);
			
			// Instancia del convertidor hex a sseg del 7 signal display HEX1
			hex_to_sseg hex_to_sseg_hex1 ({3'b000, y[1]}, sseg_hex1);
			
			// Instancia del convertidor hex a sseg del 7 signal display HEX0
			hex_to_sseg hex_to_sseg_hex0 ({3'b000, y[0]}, sseg_hex0);

		//end
		
endmodule

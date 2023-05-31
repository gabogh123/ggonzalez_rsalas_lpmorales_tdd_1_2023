module display_char(	
		input logic [7:0] ch,
		input logic [9:0] x, y,
		input logic active_pixel,
		output logic pixel
	);

	logic [5:0] charrom[2047:0]; // character generator ROM
	logic [7:0] line; // a line read from the ROM
	// Initialize ROM with characters from text file
	initial 
	$readmemb("charrom.txt", charrom);
	// Index into ROM to find line of character
	assign line = charrom[y[2:0] + {ch-65, 3'b000}]; // Subtract 65 because A
	// is entry 0
	// Reverse order of bits
	assign pixel = line[3'd7-x[2:0]] & active_pixel;
	
endmodule

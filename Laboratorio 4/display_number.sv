module display_number (
        input logic [11:0] number,
        input logic [9:0] x, y, x_offset, y_offset,
		input logic active_pixel,
        output logic pixel
    );

    logic [3:0] num_id;
    logic [99:0] numbers[2047:0]; //numbers generator from ROM
    logic [99:0] line; // aline read from the ROM

    numbers_deco num_id_deco(number, num_id);

    // Initialize ROM with numbers from text file
    initial
    $readmemb("numbers.txt", numbers);
    // Index into ROM to find line of character
	assign line = numbers[{10'b0, y} - {10'b0, y_offset} + (10'd100 * {6'b0, num_id})];
	// is entry 0
	// Reverse order of bits
	assign pixel = line[10'd100-x+x_offset] & active_pixel;

endmodule
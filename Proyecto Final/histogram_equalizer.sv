/*

Top module para el ecualizador de histogramas

*/
module histogram_equalizer(clk, rst, btn, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);

	input  logic clk;
	input  logic rst;
	input  logic btn;

	output logic vgaclk; // 25.175 MHz VGA clock
	output logic hsync, vsync;
	output logic sync_b, blank_b; // To monitor & DAC
	output logic [7:0] r, g, b; // To video DAC

	logic enable;
	logic eclk;

	wire [31:0] instruction;
	wire [31:0]   read_data;
	
	wire [31:0] 		 pc;
	wire		  mem_write;
	wire [31:0]  alu_result;
	wire [31:0]  write_data;

	/* Inicio del Procesador al presionar un boton */
	always @ (negedge btn) begin
		if (~btn)
			enable = 1;
		else
			enable = 0;
	end

	/* Inicio del clock al presionar el boton */
	assign eclk = clk & enable;


	/* ARM Processor */
	// processor arm (.clk(eclk),
	// 			   .rst(rst),
	// 			   .instruction(instruction),
	// 			   .read_data(read_data),
	// 			   .pc(pc),
	// 			   .mem_write(mem_write),
	// 			   .alu_result(alu_result),
	// 			   .write_data(write_data));

	/* Instruction Memory (ROM) */
	// instruction_memory rom (.clk(clk),
	// 				   		.A(pc),
	// 				   		.RD(instruction));

	/* Data Memory (RAM) */
	// data_memory ram (.clk(clk),
	// 				 .A(alu_result),
	// 				 .WD(write_data),
	// 				 .WE(write_enable),
	// 				 .RD(read_data));


	// mux ();

	// memoria_ram_vga (alu_result, );

	vga vga_control(clk, rst, 0, vgaclk, hsync, vsync, sync_b, blank_b, r, g, b);

endmodule

/*
Top module para el ecualizador de histogramas
*/
module histogram_equalizer(clk, rst, btn, Y);

	timeunit 1ps;
    timeprecision 1ps;

	input  logic clk;
	input  logic rst;
	input  logic btn;
	output logic   Y;

	logic enable;
	logic eclk;
	logic dclk;

	wire [31:0] instruction;
	wire [31:0]   read_data;
	
	logic [31:0] 		 pc;
	wire		  mem_write;
	wire [31:0]  alu_result;
	wire [31:0]  write_data;

	logic [31:0] data_vga;
	logic [31:0] vga_address;

	/* Inicio del Procesador al presionar un boton */
	always @ (negedge btn) begin
		if (~btn)
			enable = 1;
	end

	/* Inicio del clock al presionar el boton */
	assign eclk = clk & enable;


	/* ARM Processor */
	processor arm (.clk(eclk),
				   .rst(rst),
				   .instruction(instruction),
				   .read_data(read_data),
				   .pc(pc),
				   .mem_write(mem_write),
				   .alu_result(alu_result),
				   .write_data(write_data));

	/* RAM ROM */
	memory ram_rom (.instruction_address(pc),
					.data_address(alu_result),
					.vga_address(vga_address),
					.data_write(write_data),
					.write_enable(mem_write),
					.instruction_rd(instruction),
					.data_rd(read_data),
					.vga_rd(data_vga));

	/* Instruction Memory (ROM) *//*
	instruction_memory rom (.clk(eclk),
							.rst(rst),
					   		.A(pc),
					   		.RD(instruction));*/

	/* Data Memory (RAM) *//*
	data_memory ram (.clk(dclk),
					 .rst(rst),
					 .A(alu_result),
					 .WD(write_data),
					 .WE(mem_write),
					 .RD(read_data));*/

	// vga (alu_result, );

	assign Y = 1;

endmodule

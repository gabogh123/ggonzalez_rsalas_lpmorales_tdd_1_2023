/*

Top module para el ecualizador de histogramas

*/
module histogram_equalizer(clk, rst, btn, Y);

	input  logic clk;
	input  logic rst;
	input  logic btn;
	output logic   Y;

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
	processor arm (.clk(eclk),
				   .rst(rst),
				   .instruction(instruction),
				   .read_data(read_data),
				   .pc(pc),
				   .mem_write(mem_write),
				   .alu_result(alu_result),
				   .write_data(write_data));

	/* Instruction Memory (RAM) */
	instruction_memory ram (.clk(clk),
					   		.A(pc),
					   		.RD(instruction));

	/* Data Memory (ROM) */
	data_memory rom (.clk(clk),
					 .A(alu_result),
					 .WD(write_data),
					 .WE(write_enable),
					 .RD(read_data));


	// mux ();

	// memoria_ram_vga (alu_result, );

	assign Y = 1;

endmodule

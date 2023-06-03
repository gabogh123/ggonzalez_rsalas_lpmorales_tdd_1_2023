/*

Top module para el ecualizador de histogramas

*/
module histogram_equalizer(clk, rst, Y);

	input  logic clk;
	input  logic rst;
	output logic   Y;


	wire [31:0] instruction;
	wire [31:0]   read_data;
	
	wire [31:0] 		 pc;
	wire		  mem_write;
	wire [31:0]  alu_result;
	wire [31:0]  write_data;


	processor arm (.clk(clk),
				   .rst(rst),
				   .instruction(instruction),
				   .read_data(read_data),
				   .pc(pc),
				   .mem_write(mem_write),
				   .alu_result(alu_result),
				   .write_data(write_data));

	// mux ();

	// memoria_rom (alu_result, );

	// memoria_ram_pro (alu_result, );

	// memoria_ram_vga (alu_result, );

endmodule
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

	always @ (negedge btn) begin

		if (~btn)
			enable = 1;
		else
			enable = 0;

	end

	assign eclk = clk & enable;


	processor arm (.clk(eclk),
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

	assign Y = 1;

endmodule
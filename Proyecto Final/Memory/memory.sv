/*
Memoria que simula la RAM y la ROM
*/
module memory(instruction_address, data_address, vga_address,
			  data_write, write_enable,
			  instruction_rd, data_rd, vga_rd);

	input logic [31:0] instruction_address;
	input logic [31:0] data_address;
	input logic [31:0] vga_address;

	input logic [31:0] data_write;
	input logic write_enable;

	output logic [31:0] instruction_rd;
	output logic [31:0] data_rd;
	output logic [31:0] vga_rd;

	//logic [7:0] mem[0:393215];
	logic [7:0] mem[0:99];

	logic [19:0] IA;
	logic [19:0] DA;
	logic [19:0] VA;
	
	initial 
		$readmemb("D:/Documents - HDD/GitHub/ggonzalez_rsalas_tdd_1_2023/Proyecto Final/mem.txt", mem);  

	assign IA = instruction_address[19:0];
	assign DA = data_address[19:0];
	assign VA = vga_address[19:0];

	assign instruction_rd = {
		mem[IA], mem[IA + 1], mem[IA + 2], mem[IA + 3]
	};

	assign data_rd = {
		mem[DA], mem[DA + 1], mem[DA + 2], mem[DA + 3]
	};

	assign vga_rd = {
		mem[VA], mem[VA + 1], mem[VA + 2], mem[VA + 3]
	};

	always_comb begin

		if (write_enable) begin
			mem[DA]     = data_write[31:24];
			mem[DA + 1] = data_write[23:16];
			mem[DA + 2] = data_write[15:8];
			mem[DA + 3] = data_write[7:0];
		end

	end
	
endmodule

/*
Test bench para Memory
*/

module memory_tb;

    logic [31:0] instruction_address;
	logic [31:0] data_address;
	logic [31:0] vga_address;

	logic [31:0] data_write;
	logic write_enable;

	logic [31:0] instruction_rd;
	logic [31:0] data_rd;
	logic [31:0] vga_rd;


    memory ram_rom (.instruction_address(instruction_address),
					.data_address(data_address),
					.vga_address(vga_address),
					.data_write(data_write),
					.write_enable(write_enable),
					.instruction_rd(instruction_rd),
					.data_rd(data_rd),
					.vga_rd(vga_rd));

    initial begin
		$display("memory Test Bench:\n");

		instruction_address  = 32'b0;
        data_address  = 32'b0;
        vga_address = 32'b0;

        data_write  = 32'b0;
        write_enable = 0;

        $monitor("instruction_rd = %b (%h)\n", instruction_rd, instruction_rd,
                 "data_rd        = %b (%h)\n", data_rd, data_rd,
                 "vga_rd         = %b (%h)\n", vga_rd, vga_rd);
    end


    initial	begin

		#100

        instruction_address  = 32'b0000000000000000000000000000100;
        data_address  = 32'b00000000000000000000000000001000;
        vga_address = 32'b00000000000000000000000000001100;

        data_write  = 32'b00000000000000000000000000010000;
        write_enable = 0;

        #100;

		//

    end

    initial
	#3000 $finish;  

endmodule

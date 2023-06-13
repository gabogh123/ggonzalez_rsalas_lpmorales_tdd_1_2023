module video_gen(
        input logic clk, rst,
		input logic [9:0] x, y,
        input logic is_output_img,
		output logic [7:0] r, g, b
	);
    logic [7:0] color;
    logic en_addr;
	logic [31:0] addr, d_addr, data, offset;

    logic [31:0] original_offset, new_offset;
    assign original_offset = 32'h3a4;
    // assign original_offset = 32'h39c;
    // assign new_offset = 32'h5fbff;
    assign new_offset = 32'h274a0;

    assign offset = is_output_img ?  new_offset : original_offset; 
    gen_address get_address(is_output_img, x, y, offset, d_addr);
    address_enable addr_en(x, y, en_addr);

    current_address q_address(clk, rst, en_addr, d_addr, addr);

    //Access to memory
	instruction_memory mem (.clk(clk),
					   		.A(addr),
					   		.RD(data));

    assign color = data[7:0];
	assign {r, g, b} = en_addr ? {color, color, color} : {8'h00, 8'h00, 8'h00};
endmodule

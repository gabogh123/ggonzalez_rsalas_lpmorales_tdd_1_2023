module gen_address(
        input logic en_equalizer,
        input logic [9:0] x, y,
        input logic [31:0] offset,
        output logic [31:0] addr
    );

    always_comb begin : address_def
        if (en_equalizer)
            addr = offset - 32'h4 * y * 32'h100 - 32'h4 * x;
        else 
            addr = 32'h4 * y * 32'h100 + 32'h4 * x + offset;
    end


endmodule

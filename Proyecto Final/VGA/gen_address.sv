module gen_address(
        input logic en_equalizer,
        input logic [9:0] x, y,
        input logic [31:0] offset,
        output logic [31:0] addr
    );

    logic [31:0] size, word_bytes;
    // assign size = 32'hc8;
    assign size = 32'h100;
    assign word_bytes = 32'h4;

    always_comb begin : address_def
        if (en_equalizer)
            addr = offset - word_bytes * (y - 32'h60) * size - word_bytes * (x + 32'h40);
        else 
            addr = word_bytes * y * size + word_bytes * x + offset;
    end


endmodule

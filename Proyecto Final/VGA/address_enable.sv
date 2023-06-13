module address_enable(
        input logic [9:0] x, y,
        output logic en
    );
    logic [9:0] size;
    assign size = 10'h100;
    assign en = ((x <= size) & (y <= size)) ? 1 : 0;

endmodule

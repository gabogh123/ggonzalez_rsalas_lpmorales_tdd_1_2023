module address_enable(
        input logic [9:0] x, y,
        output logic en
    );

    assign en = ((x <= 10'hff) & (y <= 10'hff)) ? 1 : 0;

endmodule

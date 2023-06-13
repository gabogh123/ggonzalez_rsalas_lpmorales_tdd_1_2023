/*
Data Memory
Basado en 4 instancias de la memoria RAM
*/
module data_memory(clk, rst, A, WD, WE, RD);

    timeunit 1ps;
    timeprecision 1ps;

    input  logic        clk;
    input  logic        rst;
    input  logic [31:0]   A;
    input  logic [31:0]  WD;
    input  logic         WE;
    output logic [31:0]  RD;

    logic [18:0] address;

    always_comb begin
        if (A >= 393216) begin
            address = 19'b1011101110111011101;
        end else
            address = A[18:0];

        if (rst)
            address = 19'b0000000000000000000;
    end


    ram ram_3 (.clk(clk),
               .address(address),
               .data_8bits(WD[31:24]),
               .write_enable(WE),
               .q_8bits(RD[31:24]));

    ram ram_2 (.clk(clk),
               .address(address + 1),
               .data_8bits(WD[23:16]),
               .write_enable(WE),
               .q_8bits(RD[23:16]));

    ram ram_1 (.clk(clk),
               .address(address + 2),
               .data_8bits(WD[15:8]),
               .write_enable(WE),
               .q_8bits(RD[15:8]));

    ram ram_0 (.clk(clk),
               .address(address + 3),
               .data_8bits(WD[7:0]),
               .write_enable(WE),
               .q_8bits(RD[7:0]));     

endmodule

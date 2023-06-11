/*
Data Memory
Basado en 4 instancias de la memoria RAM
*/
module data_memory(clk, A, WD, WE, RD);

    timeunit 1ps;
    timeprecision 1ps;

    input  logic        clk;
    input  logic [31:0]   A;
    input  logic [31:0]  WD;
    input  logic         WE;
    output logic [31:0]  RD;

    ram ram_3 (.clk(clk),
               .address_20bits(A[19:0]),
               .data_8bits(WD[31:24]),
               .write_enable(WE),
               .q_8bits(RD[31:24]));

    ram ram_2 (.clk(clk),
               .address_20bits(A[19:0] + 1'b1),
               .data_8bits(WD[23:16]),
               .write_enable(WE),
               .q_8bits(RD[23:16]));

    ram ram_1 (.clk(clk),
               .address_20bits(A[19:0] + 2'b10),
               .data_8bits(WD[15:8]),
               .write_enable(WE),
               .q_8bits(RD[15:8]));

    ram ram_0 (.clk(clk),
               .address_20bits(A[19:0] + 2'b11),
               .data_8bits(WD[7:0]),
               .write_enable(WE),
               .q_8bits(RD[7:0]));     

endmodule

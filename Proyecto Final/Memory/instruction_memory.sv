/*
Instruction Memory
Basado en 4 instancias de la memoria ROM
*/
module instruction_memory(clk, A, RD);

    timeunit 1ps;
    timeprecision 1ps;

    input  logic        clk;
    input  logic [31:0]   A;
    output logic [31:0]  RD;

    rom rom_3 (.clk(clk),
               .address_20bits(A[19:0]),
               .q_8bits(RD[31:24]));

    rom rom_2 (.clk(clk),
               .address_20bits(A[19:0] + 1),
               .q_8bits(RD[23:16]));

    rom rom_1 (.clk(clk),
               .address_20bits(A[19:0] + 2),
               .q_8bits(RD[15:8]));

    rom rom_0 (.clk(clk),
               .address_20bits(A[19:0] + 3),
               .q_8bits(RD[7:0]));            

endmodule

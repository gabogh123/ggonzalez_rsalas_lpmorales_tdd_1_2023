/*
Instruction Memory
Basado en 4 instancias de la memoria ROM
*/
module instruction_memory(clk, rst, A, RD);

    timeunit 1ps;
    timeprecision 1ps;

    input  logic        clk;
    input  logic        rst;
    input  logic [31:0]   A;
    output logic [31:0]  RD;

    logic [18:0] address;
    logic [31:0] temp_RD;

    always_comb begin
        if (A >= 393216) begin
            address = 19'b1011111111111111100;
        end else
            address = A[18:0];

        if (rst)
            RD = 19'b0000000000000000000;
        else   
            RD = temp_RD;
    end

    rom rom_3 (.clk(clk),
               .address(address),
               .q_8bits(temp_RD[31:24]));

    rom rom_2 (.clk(clk),
               .address(address + 1),
               .q_8bits(temp_RD[23:16]));

    rom rom_1 (.clk(clk),
               .address(address + 2),
               .q_8bits(temp_RD[15:8]));

    rom rom_0 (.clk(clk),
               .address(address + 3),
               .q_8bits(temp_RD[7:0]));            

endmodule

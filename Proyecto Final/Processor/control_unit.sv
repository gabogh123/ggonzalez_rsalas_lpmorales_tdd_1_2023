/*

Control Unit

*/
module control_unit(
    clk, rst, cond, op, funct, rd, flags,
    pc_src, mem_to_reg, mem_write, alu_control, alu_src, imm_src, reg_write, reg_src
);

    input                      clk;
    input                      rst;
    input  logic [3:0]        cond;
    input  logic [1:0]          op;
    input  logic [5:0]       funct;
    input  logic [3:0]          rd;
    input  logic [4:0]       flags;

    output logic            pc_src;
    output logic        mem_to_reg;
    output logic         mem_write;
    output logic [3:0] alu_control;
    output logic           alu_src;
    output logic           imm_src;
    output logic         reg_write;
    output logic           reg_src;



endmodule
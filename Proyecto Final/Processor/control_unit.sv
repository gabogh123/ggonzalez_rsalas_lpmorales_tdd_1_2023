/*
Control Unit
Diseño basado en la figura 7.16 (a) del libro
Digital Design and Computer Architecture ARM Editon
de Sarah L. Harries & David Money Harries.
*/
module control_unit(
    clk, rst, cond, op, funct, rd, flags,
    pc_src, mem_to_reg, mem_write, alu_control, alu_src, imm_src, reg_write, reg_src);

    input  logic               clk;
    input  logic               rst;

    input  logic [3:0]        cond;
    input  logic [3:0]       flags;

    input  logic [1:0]          op;
    input  logic [5:0]       funct;
    input  logic [3:0]          rd;

    output logic            pc_src;
    output logic         reg_write;
    output logic         mem_write;

    output logic        mem_to_reg;
    output logic           alu_src;
    output logic [1:0]     imm_src;
    output logic [1:0]     reg_src;
    output logic [1:0] alu_control;

    wire         [1:0]    w_flag_w;
    wire                     w_pcs;
    wire                   w_reg_w;
    wire                   w_mem_w;
    wire                w_no_write;

    control_unit_decoder decoder (.op(op),
                                  .funct(funct),
                                  .rd(rd),
                                  .flag_w(w_flag_w),
                                  .pcs(w_pcs),
                                  .reg_w(w_reg_w),
                                  .mem_w(w_mem_w),
                                  .no_write(w_no_write),
                                  .mem_to_reg(mem_to_reg),
                                  .alu_src(alu_src),
                                  .imm_src(imm_src),
                                  .reg_src(reg_src),
                                  .alu_control(alu_control));

    conditional_logic cond_logic (.clk(clk),
                                  .rst(rst),
                                  .cond(cond),
                                  .alu_flags(flags),
                                  .flag_w(w_flag_w),
                                  .pcs(w_pcs),
                                  .reg_w(w_reg_w),
                                  .mem_w(w_mem_w),
                                  .no_write(w_no_write),
                                  .pc_src(pc_src),
                                  .reg_write(reg_write),
                                  .mem_write(mem_write));

endmodule

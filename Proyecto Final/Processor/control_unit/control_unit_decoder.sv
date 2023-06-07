/*
Decoder del Control Unit
Diseño basado en la figura 7.16 (b) del libro
Digital Design and Computer Architecture ARM Editon
de Sarah L. Harries & David Money Harries.
*/
module control_unit_decoder(op, funct, rd,
                            flag_w, pcs, reg_w, mem_w, no_write,
                            mem_to_reg, alu_src, imm_src, reg_src, alu_control);

    input  logic [1:0]          op;
    input  logic [5:0]       funct;
    input  logic [3:0]          rd;

    output logic [1:0]      flag_w;
    output logic               pcs;
    output logic             reg_w;
    output logic             mem_w;
    output logic          no_write;

    output logic        mem_to_reg;
    output logic           alu_src;
    output logic [1:0]     imm_src;
    output logic [1:0]     reg_src;
    output logic [1:0] alu_control;

    wire w_branch;
    wire w_alu_op;

    /* PC Logic */ /* tb done */
    pc_logic pc_l (.rd(rd),
                   .branch(w_branch),
                   .reg_w(reg_w),
                   .pcs(pcs));

    /* Main Decoder */ /* tb done */
    main_decoder main_deco (.op(op),
                            .funct(funct),
                            .branch(w_branch),
                            .reg_w(reg_w),
                            .mem_w(mem_w),
                            .mem_to_reg(mem_to_reg),
                            .alu_src(alu_src),
                            .imm_src(imm_src),
                            .reg_src(reg_src),
                            .alu_op(w_alu_op));

    /* ALU Decoder */ /* tb done */
    alu_decoder alu_deco (.funct(funct[4:0]),
                          .alu_op(w_alu_op),
                          .no_write(no_write),
                          .alu_control(alu_control),
                          .flag_w(flag_w));

endmodule

/*
Main Decoder del Decoder del Control Unit
Lógica basada en la tabla de verdad de la tabla 7.2 del libro
Digital Design and Computer Architecture ARM Editon
de Sarah L. Harries & David Money Harries.

|------------------------------------------------------------------------------------------------------------|
| Op | Funct [5] | Funct [0] |  Type  | | Branch | MemtoReg | MemW | ALUSrc | ImmSrc | RegW | RegSrc | ALUOp |
|------------------------------------------------------------------------------------------------------------|
| 00 |     0     |     X     | DP Reg | |    0   |     0    |   0  |    0   |   XX   |   1  |   00   |   1   |
| 00 |     1     |     X     | DP Imm | |    0   |     0    |   0  |    1   |   00   |   1  |   X0   |   1   |
| 01 |     X     |     0     |  STR   | |    0   |     X    |   1  |    1   |   01   |   0  |   10   |   0   |
| 01 |     X     |     1     |  LDR   | |    0   |     1    |   0  |    1   |   01   |   1  |   X0   |   0   |
| 10 |     X     |     X     |   B    | |    1   |     0    |   0  |    1   |   10   |   0  |   X1   |   0   |
|------------------------------------------------------------------------------------------------------------|
*/
module main_decoder(op, funct, branch, reg_w, mem_w, mem_to_reg, alu_src_b, imms, reg_src, alu_op);

    input  logic [1:0]          op;
    input  logic [5:0]       funct;

    output logic            branch;
    output logic             reg_w;
    output logic             mem_w;
    output logic        mem_to_reg;
    output logic         alu_src_b;
    output logic [1:0]        imms;
    output logic [1:0]     reg_src;
    output logic            alu_op;


    // Branch = A B'
    assign branch = (op[1] & ~op[0]);

    // MemtoReg = A' B
    assign mem_to_reg = (~op[1] & op[0]);

    // MemW = A' B D'
    assign mem_w = (~op[1] & op[0] & ~funct[0]);

    // ALUSrc = C + B + A
    assign alu_src_b = (funct[5]) |
                        (  op[1]) |
                       (   op[0]) ;

    // ImmSrc[1] = A B'
    assign imms[1] = (op[1] & ~op[0]);

    // ImmSrc[0] = A' B
    assign imms[0] = (~op[1] & op[0]);

    // RegW = A' B' + A' D
    assign reg_w = (~op[1] &   ~op[0]) |
                   (~op[1] & funct[0]) ;

    // RegSrc[1] = A' B
    assign reg_src[1] = (~op[1] & op[0]);

    // RegSrc[0] = A B'
    assign reg_src[0] = (op[1] & ~op[0]);

    // ALUOp = A' B'
    assign alu_op = (~op[1] & ~op[0]) ;

endmodule

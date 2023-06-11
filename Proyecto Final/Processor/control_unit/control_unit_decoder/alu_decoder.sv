/*
ALU Decoder del Decoder del Control Unit
Lógica basada en la tabla de verdad de la tabla 7.4 del libro
Digital Design and Computer Architecture ARM Editon
de Sarah L. Harries & David Money Harries.

|-----------------------------------------------------------------------------------------------|
|       | Funct [4:1] | Funct [0] |       | |                  |            |         |         |
| ALUOp |     cmd     |     S     | Notes | | ALUControl [1:0] | FlagW[1:0] | NoWrite | ALUSrcA |
|-----------------------------------------------------------------------------------------------|
|   0   |   X X X X   |     X     | notDP | |        00        |     00     |    0    |    0    |
|-----------------------------------------------------------------------------------------------|
|   1   |   0 1 0 0   |     0     |  ADD  | |        00        |     00     |    0    |    0    |
|       |             |     1     |       | |                  |     11     |    0    |    0    |
|       |---------------------------------------------------------------------------------------|
|       |   0 0 1 0   |     0     |  SUB  | |        01        |     00     |    0    |    0    |
|       |             |     1     |       | |                  |     11     |    0    |    0    |
|       |---------------------------------------------------------------------------------------|
|       |   0 0 0 0   |     0     |  AND  | |        10        |     00     |    0    |    0    |
|       |             |     1     |       | |                  |     10     |    0    |    0    |
|       |---------------------------------------------------------------------------------------|
|       |   1 1 0 0   |     0     |  ORR  | |        11        |     00     |    0    |    0    |
|       |             |     1     |       | |                  |     10     |    0    |    0    |
|       |---------------------------------------------------------------------------------------|
|       |   1 0 1 0   |     1     |  CMP  | |        01        |     11     |    1    |    0    |
|       |---------------------------------------------------------------------------------------|
|       |   1 1 0 1   |     0     |  MOV  | |        00        |     00     |    0    |    1    |
|       |             |     1     |       | |                  |     11     |    0    |    1    |
|-----------------------------------------------------------------------------------------------|
*/
module alu_decoder(funct, alu_op, no_write, alu_control, flag_w, alu_src_a);

    input  logic [4:0]       funct;
    input  logic            alu_op;

    output logic          no_write;
    output logic [1:0] alu_control;
    output logic [1:0]      flag_w;
    output logic         alu_src_a;

    logic S;
    logic [3:0] cmd;

    assign S = funct[0];
    assign cmd = funct[4:1];

    // ALUControl[1] = A B' C' D' E' + A B C D' E'
    assign alu_control[1] = (alu_op & ~cmd[3] & ~cmd[2] & ~cmd[1] & ~cmd[0]) |
                            (alu_op &  cmd[3] &  cmd[2] & ~cmd[1] & ~cmd[0]) ;

     // ALUControl[0] = A C' D E' + A B C D' E'
    assign alu_control[0] = (alu_op & ~cmd[2] &  cmd[1] & ~cmd[0]) |
                            (alu_op &  cmd[3] &  cmd[2] & ~cmd[1] & ~cmd[0]) ;

    // Flag_w[1] = A B' D' E' F + A C' D E' F + A B C D' F
    assign flag_w[1] = (alu_op & ~cmd[3] & ~cmd[1] & ~cmd[0] & S) |
                       (alu_op & ~cmd[2] &  cmd[1] & ~cmd[0] & S) |
                       (alu_op &  cmd[3] &  cmd[2] & ~cmd[1] & S) ;

    // Flag_w[0] = A C' D E' F + A B' C D' E' F + A B C D' E F 
    assign flag_w[0] = (alu_op & ~cmd[2] & cmd[1] & ~cmd[0] &       S )    |
                       (alu_op & ~cmd[3] & cmd[2] & ~cmd[1] & ~cmd[0] & S) |
                       (alu_op &  cmd[3] & cmd[2] & ~cmd[1] &  cmd[0] & S) ;                       

    // NoWrite = A B C' D E'
    assign no_write = (alu_op & cmd[3] & ~cmd[2] & cmd[1] & ~cmd[0]) ;  

    // ALUSrcA = A B C D' E
    assign alu_src_a = (alu_op & cmd[3] & cmd[2] & ~cmd[1] & cmd[0]) ;  

endmodule

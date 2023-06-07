/*
Conditional Logic del Control Unit
Diseño basado en la figura 7.16 (c) del libro
Digital Design and Computer Architecture ARM Editon
de Sarah L. Harries & David Money Harries.
*/
module conditional_logic
       (clk, rst, cond, alu_flags,
        flag_w, pcs, reg_w, mem_w, no_write,
        pc_src, reg_write, mem_write);

    input  logic             clk;
    input  logic             rst;
    input  logic [3:0]      cond;
    input  logic [3:0] alu_flags;

    input  logic [1:0]    flag_w;
    input  logic             pcs;
    input  logic           reg_w;
    input  logic           mem_w;
    input  logic        no_write;

    output logic          pc_src;
    output logic       reg_write;
    output logic       mem_write;


    logic [1:0] flag_write;


    wire         cond_ex;
    wire  [3:0]    flags;


    assign pc_src = pcs & cond_ex;

    assign reg_write = reg_w & ~no_write & cond_ex;
    
    assign mem_write = mem_w & cond_ex;

    /* Condition Checker */ /* tb done */
    condition_checker cond_checker (.cond(cond),
                                    .N(flags[3]),
                                    .Z(flags[2]),
                                    .C(flags[1]),
                                    .V(flags[0]),
                                    .cond_ex(cond_ex));

    assign flag_write[1] = flag_w[1] & cond_ex;
    assign flag_write[0] = flag_w[0] & cond_ex;

    register # (.N(2)) flags_register_32 (.clk(clk),
                                          .rst(rst),
                                          .en(flag_write[1]),
                                          .D(alu_flags[3:2]),
                                          .Q(flags[3:2]));

    register # (.N(2)) flags_register_10 (.clk(clk),
                                          .rst(rst),
                                          .en(flag_write[0]),
                                          .D(alu_flags[1:0]),
                                          .Q(flags[1:0]));

endmodule

/*

Register File

*/
module register_file(clk, rst, a_1, a_2, a_3, wd_3, r_15, we_3, rd_1, rd_2);

    input          clk;
    input          rst;
    input   [3:0]  a_1;
    input   [3:0]  a_2;
    input   [3:0]  a_3;
    input  [31:0] wd_3;
    input  [31:0] r_15;
    input         we_3;

    output [31:0] rd_1;
    output [31:0] rd_2;



endmodule
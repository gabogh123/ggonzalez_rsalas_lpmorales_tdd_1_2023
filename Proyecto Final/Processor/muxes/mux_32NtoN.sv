/*
MUX 8:1 parametrizable para N bits
*/
module mux_32NtoN
    #  (parameter N = 32)
       (I00, I01, I02, I03, I04, I05, I06, I07,
        I08, I09, I10, I11, I12, I13, I14, I15,
        I16, I17, I18, I19, I20, I21, I22, I23,
        I24, I25, I26, I27, I28, I29, I30, I31,
        rst, S, enable, O);

    input  logic [N-1:0] I00;
    input  logic [N-1:0] I01;
    input  logic [N-1:0] I02;
    input  logic [N-1:0] I03;
    input  logic [N-1:0] I04;
    input  logic [N-1:0] I05;
    input  logic [N-1:0] I06;
    input  logic [N-1:0] I07;
    input  logic [N-1:0] I08;
    input  logic [N-1:0] I09;
    input  logic [N-1:0] I10;
    input  logic [N-1:0] I11;
    input  logic [N-1:0] I12;
    input  logic [N-1:0] I13;
    input  logic [N-1:0] I14;
    input  logic [N-1:0] I15;
    input  logic [N-1:0] I16;
    input  logic [N-1:0] I17;
    input  logic [N-1:0] I18;
    input  logic [N-1:0] I19;
    input  logic [N-1:0] I20;
    input  logic [N-1:0] I21;
    input  logic [N-1:0] I22;
    input  logic [N-1:0] I23;
    input  logic [N-1:0] I24;
    input  logic [N-1:0] I25;
    input  logic [N-1:0] I26;
    input  logic [N-1:0] I27;
    input  logic [N-1:0] I28;
    input  logic [N-1:0] I29;
    input  logic [N-1:0] I30;
    input  logic [N-1:0] I31;

    input  logic         rst;
    input  logic   [4:0]   S;
    input  logic      enable;
    output logic [N-1:0]   O;


    logic enable_0;
    logic enable_1;
    logic enable_2;
    logic enable_3;


    wire [N-1:0] O_0;
    wire [N-1:0] O_1;
    wire [N-1:0] O_2;
    wire [N-1:0] O_3;


    logic [N-1:0]   O_temp;


    assign enable_0 = ~S[4] & ~S[3] & enable;

    mux_8NtoN # (.N(N)) m8NtoN_0 (.I0(I00),
                                  .I1(I01),
                                  .I2(I02),
                                  .I3(I03),
                                  .I4(I04),
                                  .I5(I05),
                                  .I6(I06),
                                  .I7(I07),
                                  .enable(enable_0),
                                  .rst(rst),
                                  .S(S[2:0]),
                                  .O(O_0));


    assign enable_1 = ~S[4] & S[3] & enable;

    mux_8NtoN # (.N(N)) m8NtoN_1 (.I0(I08),
                                  .I1(I09),
                                  .I2(I10),
                                  .I3(I11),
                                  .I4(I12),
                                  .I5(I13),
                                  .I6(I14),
                                  .I7(I15),
                                  .enable(enable_1),
                                  .rst(rst),
                                  .S(S[2:0]),
                                  .O(O_1));


    assign enable_2 = S[4] & ~S[3] & enable;

    mux_8NtoN # (.N(N)) m8NtoN_2 (.I0(I16),
                                  .I1(I17),
                                  .I2(I18),
                                  .I3(I19),
                                  .I4(I20),
                                  .I5(I21),
                                  .I6(I22),
                                  .I7(I23),
                                  .enable(enable_2),
                                  .rst(rst),
                                  .S(S[2:0]),
                                  .O(O_2));


    assign enable_3 = S[4] & S[3] & enable;

    mux_8NtoN # (.N(N)) m8NtoN_3 (.I0(I24),
                                  .I1(I25),
                                  .I2(I26),
                                  .I3(I27),
                                  .I4(I28),
                                  .I5(I29),
                                  .I6(I30),
                                  .I7(I31),
                                  .enable(enable_3),
                                  .rst(rst),
                                  .S(S[2:0]),
                                  .O(O_3));


    assign O = O_0 | O_1 | O_2 | O_3;


endmodule

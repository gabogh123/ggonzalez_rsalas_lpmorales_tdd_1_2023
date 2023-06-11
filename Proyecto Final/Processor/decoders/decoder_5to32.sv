/*
Decodificador 5 a 32
*/
module decoder_5to32(A, enable,
                     D00, D01, D02, D03, D04, D05, D06, D07,
                     D08, D09, D10, D11, D12, D13, D14, D15,
                     D16, D17, D18, D19, D20, D21, D22, D23,
                     D24, D25, D26, D27, D28, D29, D30, D31);

    input  logic [4:0]      A;
    input              enable;

    output logic          D00;
    output logic          D01;
    output logic          D02;
    output logic          D03;
    output logic          D04;
    output logic          D05;
    output logic          D06;
    output logic          D07;
    output logic          D08;
    output logic          D09;
    output logic          D10;
    output logic          D11;
    output logic          D12;
    output logic          D13;
    output logic          D14;
    output logic          D15;
    output logic          D16;
    output logic          D17;
    output logic          D18;
    output logic          D19;
    output logic          D20;
    output logic          D21;
    output logic          D22;
    output logic          D23;
    output logic          D24;
    output logic          D25;
    output logic          D26;
    output logic          D27;
    output logic          D28;
    output logic          D29;
    output logic          D30;
    output logic          D31;

    wire E0;
    wire E1;
    wire E2;
    wire E3;

    decoder_2to4 d2to4_0 (.A(A[4:3]),
                          .enable(enable),
                          .D0(E0),
                          .D1(E1),
                          .D2(E2),
                          .D3(E3));

    decoder_3to8 d3to8_0 (.A(A[2:0]),
                          .enable(E0),
                          .D0(D00),
                          .D1(D01),
                          .D2(D02),
                          .D3(D03),
                          .D4(D04),
                          .D5(D05),
                          .D6(D06),
                          .D7(D07));

    decoder_3to8 d3to8_1 (.A(A[2:0]),
                          .enable(E1),
                          .D0(D08),
                          .D1(D09),
                          .D2(D10),
                          .D3(D11),
                          .D4(D12),
                          .D5(D13),
                          .D6(D14),
                          .D7(D15));

    decoder_3to8 d3to8_2 (.A(A[2:0]),
                          .enable(E2),
                          .D0(D16),
                          .D1(D17),
                          .D2(D18),
                          .D3(D19),
                          .D4(D20),
                          .D5(D21),
                          .D6(D22),
                          .D7(D23));

    decoder_3to8 d3to8_3 (.A(A[2:0]),
                          .enable(E3),
                          .D0(D24),
                          .D1(D25),
                          .D2(D26),
                          .D3(D27),
                          .D4(D28),
                          .D5(D29),
                          .D6(D30),
                          .D7(D31));                                            

endmodule

/*
Register File
*/
module register_file(clk, rst, a_1, a_2, a_3, wd_3, r_15, we_3, rd_1, rd_2);

    input  logic        clk;
    input  logic        rst;
    input  logic [3:0]  a_1;
    input  logic [3:0]  a_2;
    input  logic [3:0]  a_3;
    input  logic [31:0] wd_3;
    input  logic [31:0] r_15;
    input  logic        we_3;

    output logic [31:0] rd_1;
    output logic [31:0] rd_2;

    logic re; // RegRead -> read enable
    assign re = 1;

    /*
    cables entre salida decoder a enable registro
    */
    wire we_3_00;
    wire we_3_01;
    wire we_3_02;
    wire we_3_03;
    wire we_3_04;
    wire we_3_05;
    wire we_3_06;
    wire we_3_07;
    wire we_3_08;
    wire we_3_09;
    wire we_3_10;
    wire we_3_11;
    wire we_3_12;
    wire we_3_13;
    wire we_3_14;
    wire we_3_15;
    wire we_3_16;
    wire we_3_17;
    wire we_3_18;
    wire we_3_19;
    wire we_3_20;
    wire we_3_21;
    wire we_3_22;
    wire we_3_23;
    wire we_3_24;
    wire we_3_25;
    wire we_3_26;
    wire we_3_27;
    wire we_3_28;
    wire we_3_29;
    wire we_3_30;
    wire we_3_31;

    /* 
    con un decoder 5 a 32 se activará el enable del registro al que se estará escribiendo,
    "we_3" es el enable del decoder y "a_3" es el que trae los 5 bits para el decoder.
    */
    decoder_5to32 d5to32 (.A({1'b0, a_3}),
                          .enable(we_3),
                          .D00(we_3_00),
                          .D01(we_3_01),
                          .D02(we_3_02),
                          .D03(we_3_03),
                          .D04(we_3_04),
                          .D05(we_3_05),
                          .D06(we_3_06),
                          .D07(we_3_07),
                          .D08(we_3_08),
                          .D09(we_3_09),
                          .D10(we_3_10),
                          .D11(we_3_11),
                          .D12(we_3_12),
                          .D13(we_3_13),
                          .D14(we_3_14),
                          .D15(we_3_15),
                          .D16(we_3_16),
                          .D17(we_3_17),
                          .D18(we_3_18),
                          .D19(we_3_19),
                          .D20(we_3_20),
                          .D21(we_3_21),
                          .D22(we_3_22),
                          .D23(we_3_23),
                          .D24(we_3_24),
                          .D25(we_3_25),
                          .D26(we_3_26),
                          .D27(we_3_27),
                          .D28(we_3_28),
                          .D29(we_3_29),
                          .D30(we_3_30),
                          .D31(we_3_31));

    /*
    cables entre salida de los registros y los mux para la salida
    */
    wire [31:0] q_r_00;
    wire [31:0] q_r_01;
    wire [31:0] q_r_02;
    wire [31:0] q_r_03;
    wire [31:0] q_r_04;
    wire [31:0] q_r_05;
    wire [31:0] q_r_06;
    wire [31:0] q_r_07;
    wire [31:0] q_r_08;
    wire [31:0] q_r_09;
    wire [31:0] q_r_10;
    wire [31:0] q_r_11;
    wire [31:0] q_r_12;
    wire [31:0] q_r_13;
    wire [31:0] q_r_14;
    wire [31:0] q_r_15;
    wire [31:0] q_r_16;
    wire [31:0] q_r_17;
    wire [31:0] q_r_18;
    wire [31:0] q_r_19;
    wire [31:0] q_r_20;
    wire [31:0] q_r_21;
    wire [31:0] q_r_22;
    wire [31:0] q_r_23;
    wire [31:0] q_r_24;
    wire [31:0] q_r_25;
    wire [31:0] q_r_26;
    wire [31:0] q_r_27;
    wire [31:0] q_r_28;
    wire [31:0] q_r_29;
    wire [31:0] q_r_30;
    wire [31:0] q_r_31;

    /*
    "wd_3" es el dato de 32 bits que va directo a todos los registros y solo se escribirá
    en el registro con el enable en 1
    */

    /* Register */
	register # (.N(32)) R0 (.clk(clk),
                            .rst(rst),
                            .en(we_3_00),
                            .D(wd_3),
                            .Q(q_r_00)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R1 (.clk(clk),
                            .rst(rst),
                            .en(we_3_01),
                            .D(wd_3),
                            .Q(q_r_01)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R2 (.clk(clk),
                            .rst(rst),
                            .en(we_3_02),
                            .D(wd_3),
                            .Q(q_r_02)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R3 (.clk(clk),
                            .rst(rst),
                            .en(we_3_03),
                            .D(wd_3),
                            .Q(q_r_03)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R4 (.clk(clk),
                            .rst(rst),
                            .en(we_3_04),
                            .D(wd_3),
                            .Q(q_r_04)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R5 (.clk(clk),
                            .rst(rst),
                            .en(we_3_05),
                            .D(wd_3),
                            .Q(q_r_05)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R6 (.clk(clk),
                            .rst(rst),
                            .en(we_3_06),
                            .D(wd_3),
                            .Q(q_r_06)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R7 (.clk(clk),
                            .rst(rst),
                            .en(we_3_07),
                            .D(wd_3),
                            .Q(q_r_07)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R8 (.clk(clk),
                            .rst(rst),
                            .en(we_3_08),
                            .D(wd_3),
                            .Q(q_r_08)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R9 (.clk(clk),
                            .rst(rst),
                            .en(we_3_09),
                            .D(wd_3),
                            .Q(q_r_09)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R10 (.clk(clk),
                            .rst(rst),
                            .en(we_3_10),
                            .D(wd_3),
                            .Q(q_r_10)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R11 (.clk(clk),
                            .rst(rst),
                            .en(we_3_11),
                            .D(wd_3),
                            .Q(q_r_11)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R12 (.clk(clk),
                            .rst(rst),
                            .en(we_3_12),
                            .D(wd_3),
                            .Q(q_r_12)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R13 (.clk(clk),
                            .rst(rst),
                            .en(we_3_13),
                            .D(wd_3),
                            .Q(q_r_13)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R14 (.clk(clk),
                            .rst(rst),
                            .en(we_3_14),
                            .D(wd_3),
                            .Q(q_r_14)); // Salida a ambos mux32to1

    /*
    "r_15" siempre esta escribiendo al registro 15, guardando el pc + 8
    */
    /* Register */
	register # (.N(32)) R15 (.clk(clk),
                            .rst(rst),
                            .en(1'b1), // Siempre se le esta escribiendo
                            .D(r_15), // Siempre se le escribe r_15
                            .Q(q_r_15)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R16 (.clk(clk),
                            .rst(rst),
                            .en(we_3_16),
                            .D(wd_3),
                            .Q(q_r_16)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R17 (.clk(clk),
                            .rst(rst),
                            .en(we_3_17),
                            .D(wd_3),
                            .Q(q_r_17)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R18 (.clk(clk),
                            .rst(rst),
                            .en(we_3_18),
                            .D(wd_3),
                            .Q(q_r_18)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R19 (.clk(clk),
                            .rst(rst),
                            .en(we_3_19),
                            .D(wd_3),
                            .Q(q_r_19)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R20 (.clk(clk),
                            .rst(rst),
                            .en(we_3_20),
                            .D(wd_3),
                            .Q(q_r_20)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R21 (.clk(clk),
                            .rst(rst),
                            .en(we_3_21),
                            .D(wd_3),
                            .Q(q_r_21)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R22 (.clk(clk),
                            .rst(rst),
                            .en(we_3_22),
                            .D(wd_3),
                            .Q(q_r_22)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R23 (.clk(clk),
                            .rst(rst),
                            .en(we_3_23),
                            .D(wd_3),
                            .Q(q_r_23)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R24 (.clk(clk),
                            .rst(rst),
                            .en(we_3_24),
                            .D(wd_3),
                            .Q(q_r_24)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R25 (.clk(clk),
                            .rst(rst),
                            .en(we_3_25),
                            .D(wd_3),
                            .Q(q_r_25)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R26 (.clk(clk),
                            .rst(rst),
                            .en(we_3_26),
                            .D(wd_3),
                            .Q(q_r_26)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R27 (.clk(clk),
                            .rst(rst),
                            .en(we_3_27),
                            .D(wd_3),
                            .Q(q_r_27)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R28 (.clk(clk),
                            .rst(rst),
                            .en(we_3_28),
                            .D(wd_3),
                            .Q(q_r_28)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R29 (.clk(clk),
                            .rst(rst),
                            .en(we_3_29),
                            .D(wd_3),
                            .Q(q_r_29)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R30 (.clk(clk),
                            .rst(rst),
                            .en(we_3_30),
                            .D(wd_3),
                            .Q(q_r_30)); // Salida a ambos mux32to1

    /* Register */
	register # (.N(32)) R31 (.clk(clk),
                             .rst(rst),
                             .en(we_3_31),
                             .D(wd_3),
                             .Q(q_r_31)); // Salida a ambos mux32to1


    /*
    todos los valores de los registros van a dos mux_32to1 en paralelo. Un mux tendrá un
    selector con "a_1" y la salida será "rd_1" y el otro tendrá el selector "a_2" y la salida será
    "rd_2"
    */

    mux_32NtoN #(.N(32)) read_data_1 (.I00(q_r_00),
                                      .I01(q_r_01),
                                      .I02(q_r_02),
                                      .I03(q_r_03),
                                      .I04(q_r_04),
                                      .I05(q_r_05),
                                      .I06(q_r_06),
                                      .I07(q_r_07),
                                      .I08(q_r_08),
                                      .I09(q_r_09),
                                      .I10(q_r_10),
                                      .I11(q_r_11),
                                      .I12(q_r_12),
                                      .I13(q_r_13),
                                      .I14(q_r_14),
                                      .I15(q_r_15),
                                      .I16(q_r_16),
                                      .I17(q_r_17),
                                      .I18(q_r_18),
                                      .I19(q_r_19),
                                      .I20(q_r_20),
                                      .I21(q_r_21),
                                      .I22(q_r_22),
                                      .I23(q_r_23),
                                      .I24(q_r_24),
                                      .I25(q_r_25),
                                      .I26(q_r_26),
                                      .I27(q_r_27),
                                      .I28(q_r_28),
                                      .I29(q_r_29),
                                      .I30(q_r_30),
                                      .I31(q_r_31),
                                      .S({1'b0, a_1}),
                                      //.enable(re),
                                      .enable(1'b1),
                                      .O(rd_1));

    mux_32NtoN #(.N(32)) read_data_2 (.I00(q_r_00),
                                      .I01(q_r_01),
                                      .I02(q_r_02),
                                      .I03(q_r_03),
                                      .I04(q_r_04),
                                      .I05(q_r_05),
                                      .I06(q_r_06),
                                      .I07(q_r_07),
                                      .I08(q_r_08),
                                      .I09(q_r_09),
                                      .I10(q_r_10),
                                      .I11(q_r_11),
                                      .I12(q_r_12),
                                      .I13(q_r_13),
                                      .I14(q_r_14),
                                      .I15(q_r_15),
                                      .I16(q_r_16),
                                      .I17(q_r_17),
                                      .I18(q_r_18),
                                      .I19(q_r_19),
                                      .I20(q_r_20),
                                      .I21(q_r_21),
                                      .I22(q_r_22),
                                      .I23(q_r_23),
                                      .I24(q_r_24),
                                      .I25(q_r_25),
                                      .I26(q_r_26),
                                      .I27(q_r_27),
                                      .I28(q_r_28),
                                      .I29(q_r_29),
                                      .I30(q_r_30),
                                      .I31(q_r_31),
                                      .S({1'b0, a_2}),
                                      //.enable(re),
                                      .enable(1'b1),
                                      .O(rd_2));


endmodule

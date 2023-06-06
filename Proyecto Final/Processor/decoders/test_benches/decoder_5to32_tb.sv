/*
Test Bench para Decodificador 5 a 32
*/
module decoder_5to32_tb;

    logic [4:0]      A;
    logic       enable;

    logic          D00;
    logic          D01;
    logic          D02;
    logic          D03;
    logic          D04;
    logic          D05;
    logic          D06;
    logic          D07;
    logic          D08;
    logic          D09;
    logic          D10; 
    logic          D11;
    logic          D12;
    logic          D13;
    logic          D14;
    logic          D15;
    logic          D16;
    logic          D17;
    logic          D18;
    logic          D19;
    logic          D20;
    logic          D21;
    logic          D22;
    logic          D23;
    logic          D24;
    logic          D25;
    logic          D26;
    logic          D27;
    logic          D28;
    logic          D29;
    logic          D30;
    logic          D31;

    decoder_5to32 uut (.A(A),
                      .enable(enable),
                      .D00(D00),
                      .D01(D01),
                      .D02(D02),
                      .D03(D03),
                      .D04(D04),
                      .D05(D05),
                      .D06(D06),
                      .D07(D07),
                      .D08(D08),
                      .D09(D09),
                      .D10(D10),
                      .D11(D11),
                      .D12(D12),
                      .D13(D13),
                      .D14(D14),
                      .D15(D15),
                      .D16(D16),
                      .D17(D17),
                      .D18(D18),
                      .D19(D19),
                      .D20(D20),
                      .D21(D21),
                      .D22(D22),
                      .D23(D23),
                      .D24(D24),
                      .D25(D25),
                      .D26(D26),
                      .D27(D27),
                      .D28(D28),
                      .D29(D29),
                      .D30(D30),
                      .D31(D31));

    initial begin

        $display("decoder_5to32 Test Bench:\n");

		A <= 5'b00000;
		enable <= 0;

        $monitor("A=%b with enable=%b\n", A, enable,
                 "D00=%b D01=%b D02=%b D03=%b D04=%b D05=%b D06=%b D07=%b\n",
                  D00, D01, D02, D03, D04, D05, D06, D07,
                 "D08=%b D09=%b D10=%b D11=%b D12=%b D13=%b D14=%b D15=%b\n",
                  D08, D09, D10, D11, D12, D13, D14, D15,
                 "D16=%b D17=%b D18=%b D19=%b D20=%b D21=%b D22=%b D23=%b\n",
                  D16, D17, D18, D19, D20, D21, D22, D23,
                 "D24=%b D25=%b D26=%b D27=%b D28=%b D29=%b D30=%b D31=%b\n",
                  D24, D25, D26, D27, D28, D29, D30, D31);
    end

    initial	begin
	
		#100

        enable = 1;

        #100

		A <= 5'b00000;

        #100

        // assert

        #100

        A <= 5'b00110;

        #100

        // assert

        #100

        A <= 5'b01011;

        #100

        // assert

        #100

        A <= 5'b10000;

        #100

        // assert

        #100

        A <= 5'b10110;

        #100

        // assert

        #100

        A <= 5'b11100;

        #100

        // assert

        #100

        A <= 5'b11111;

        #100

        // assert

        #100

        enable = 0;

        #100

        A <= 5'b11111;

        #100

        // assert

        #100

        A <= 5'b10110;

        #100

        // assert

		#100;

        // Done

    end
	 
endmodule
/*
Test Bench para Data Memory
*/
module data_memory_tb;

    timeunit 1ps;
    timeprecision 1ps;

    logic        clk;
    logic [31:0]   A; // alu_result
    logic [31:0]  WD; // write_data
    logic         WE; // write_enable
    logic [31:0]  RD; // read_data

    data_memory rom (.clk(clk),
					 .A(A),
					 .WD(WD),
					 .WE(WE),
					 .RD(RD));

    initial begin
		$display("data_memory Test Bench:\n");

		clk = 0;

        A = 32'b0;
        WD = 32'b0;
        WE = 1'b0;

        $monitor("A = %b (%h %h %h %h)\n", A,
                  A[31:24], A[23:16], A[15:8], A[7:0],
                 "WD = %b (%h %h %h %h)\n", WD,
                  WD[31:24], WD[23:16], WD[15:8], WD[7:0],
                 "WE = %b\n",
                  WE,
                 "RD = %b (%h %h %h %h)\n", RD,
                  RD[31:24], RD[23:16], RD[15:8], RD[7:0]);
    end

    always
		#50 clk = !clk;

    initial	begin

		#100

        WE = 0;

        #100

        A = 32'b00000000000000000000000000000000;
        WD = 32'b11100000010000000100000000000001;

        #100

        WE = 1;

        A = 32'b00000000000000000000000000010100;
        WD = 32'b11100000100000000010000000000001;

        #100

        A = 32'b00000000000000000000000000111100;
        WD = 32'b11100000010000000100000000000001;

        #100

        WE = 0;

        A = 32'b00000000000000000110110101001000;
        WD = 32'b11100101100000110011000000100000;

        #100

        A = 32'b00000000000000101010010101001000;
        WD = 32'b11101010000000000000001101100010;

        #100

        WE = 1;

        A = 32'b00000000000010001011110101101100;
        WD = 32'b11100001010100010000000000000000;

        #100;

		//

    end

    initial
	#1500 $finish;   


endmodule

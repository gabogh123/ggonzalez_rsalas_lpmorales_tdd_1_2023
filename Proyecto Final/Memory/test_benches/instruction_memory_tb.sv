/*
Test Bench para Instruction Memory
*/
module instruction_memory_tb;

    timeunit 1ps;
    timeprecision 1ps;

    logic        clk;
    logic [31:0]   A; // pc
    logic [31:0]  RD; // instruction

    instruction_memory uut (.clk(clk),
                            .A(A),
                            .RD(RD));

    initial begin
		$display("instruction_memory Test Bench:\n");

		clk = 0;

        A = 32'b0;

        $monitor("A = %b (%h %h %h %h)\n", A,
                  A[31:24], A[23:16], A[15:8], A[7:0],
                 "RD = %b (%h %h %h %h)\n", RD,
                  RD[31:24], RD[23:16], RD[15:8], RD[7:0]);
    end

    always
		#50 clk = !clk;

    initial	begin

        #100

        A = 32'b00000000000000000000000000000000;

        #100

        A = 32'b00000000000000000000000000010100;

		#100

        A = 32'b00000000000000000000000000111100;

        #100

        A = 32'b00000000000000000000000101001000;

        #100

        A = 32'b00000000000000000110110101001000;

        #100

        A = 32'b00000000000000101010010101001000;

        #100;

		// Done

    end

    initial
	#1000 $finish;

    

endmodule

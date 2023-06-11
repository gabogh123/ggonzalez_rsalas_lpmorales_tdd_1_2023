/*
Test Bench para rom
*/
module rom_tb;

    timeunit 1ps;
    timeprecision 1ps;

    logic                   clk;
    logic [19:0] address_20bits;
    logic [7:0]         q_8bits;

    rom uut (.clk(clk),
             .address_20bits(address_20bits),
             .q_8bits(q_8bits));

    initial begin
		$display("rom Test Bench:\n");

		clk = 0;

        address_20bits = 20'b0;

        $monitor("address_20bits = %b (%h)\n", address_20bits, address_20bits,
                 "q_8bits = %b (%h)\n", q_8bits, q_8bits);
    end

    always
		#50 clk = !clk;

    initial	begin

		#100

        address_20bits = 20'b00000000000000000000;

        #100

        address_20bits = 20'b00000000000000001100;

        #100

        address_20bits = 20'b00000000000010101100;

        #100

        address_20bits = 20'b00000000010010101001;

        #100

        address_20bits = 20'b00000001111110001000;

        #100;

		// Done

    end

    initial
	#1000 $finish;

endmodule

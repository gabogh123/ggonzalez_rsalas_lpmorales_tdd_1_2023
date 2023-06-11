/*
0bit_addressTest Bench para ram
*/
module ram_tb;

    timeunit 1ps;
    timeprecision 1ps;

    logic 				    clk;
	logic [19:0] address_20bits;
	logic  [7:0]     data_8bits;
	logic 		   write_enable;
	logic  [7:0]        q_8bits;

    ram uut (.clk(clk),
             .address_20bits(address_20bits),
             .data_8bits(data_8bits),
             .write_enable(write_enable),
             .q_8bits(q_8bits));

    initial begin
		$display("ram Test Bench:\n");

		clk = 0;

        address_20bits = 20'b0;
        data_8bits = 8'b0;
        write_enable = 1'b0;

        $monitor("address_20bits = %b (%h)\n", address_20bits, address_20bits,
                 "data_8bits = %b (%h)\n", data_8bits, data_8bits,
                 "write_enable = %b\n", write_enable,
                 "q_8bits = %b (%h)\n", q_8bits, q_8bits);
    end

    always
		#50 clk = !clk;

    initial	begin

		#100

        write_enable = 0;

        #100

        address_20bits = 20'b00000000000000000000;
        data_8bits = 8'b11111111;

        #100

        write_enable = 1;

        address_20bits = 20'b10011111111111111100;
        data_8bits = 8'b11100111;

        #100

        address_20bits = 20'b10011111111111111110;
        data_8bits = 8'b11110000;

        #100

        write_enable = 0;

        address_20bits = 20'b10011111111111111100;
        data_8bits = 8'b10111001;

        #100

        address_20bits = 20'b10011111111111111110;
        data_8bits = 8'b10111001;

        #100

        write_enable = 1;

        address_20bits = 20'b10011111111111111101;
        data_8bits = 8'b00001111;

        #100;

		// Done

    end

    initial
	#1500 $finish;                                 

endmodule

/*
Test Bench de la ALU
*/
module alu_p_tb;

    parameter integer N = 32;

    logic [N-1:0]     A;
	logic [N-1:0]     B;
	logic   [1:0]  func;
	logic [N-1:0]     Y;
	logic   [3:0] flags;

    alu_p # (.N(N)) uut (.A(A),
                         .B(B),
                         .func(func),
                         .Y(Y),
                         .flags(flags));

    initial begin
		$display("alu Test Bench:\n");

		A = 32'b0;
        B = 32'b0;
        func = 2'b00;

		$monitor("func: %b\nA = %b *func* B = %b\nY = %b\n", func, A, B, Y,
                 "N=%b Z=%b C=%b V=%b\n", flags[3], flags[2], flags[1], flags[0]);
	end

    initial	begin

		#100

        $display("0. 00 = sum:\n");
        A = 32'b11100101100111110001000000100000;
		B = 32'b00000000000000000000000000000100;
        func = 2'b00;

        #100
        	
		assert((Y === 32'b11100101100111110001000000100100) & (flags === 4'b0000))
        else $error("Failed");
	
		#100

        $display("1. 01 = sub:\n");
        A = 32'b11100101100111110001000000100101;
		B = 32'b00000000000000000000000000000100;
        func = 2'b01;

        #100
        	
		assert((Y === 32'b11100101100111110001000000100001) & (flags === 4'b0000))
        else $error("Failed");

        #100

        $display("1. 01 = sub:\n");
        A = 32'b00000101100111110001000000100101;
		B = 32'b00000101100111110001000000100101;
        func = 2'b01;

        #100
        	
		assert((Y === 32'b0) & (flags === 4'b0100))
        else $error("Failed");

        #100

        $display("1. 01 = sub:\n");
        A = 32'b00000000000000000000000000000100;
		B = 32'b00000101100111110001000000100101;
        func = 2'b01;

        #100
        	
		assert((Y === 32'b11100101100111110001000000100001) & (flags === 4'b1000))
        else $error("Failed");

        #100

        $display("5. 10 = and:\n");
        A = 32'b11101011101000101101110001001010;
		B = 32'b01001010101011101010101010010101;
        func = 2'b10;

        #100
        	
		assert((Y === 32'b01001010101000101000100000000000) & (flags === 4'b0000))
        else $error("Failed");

        #100

        $display("6. 11 = or:\n");
        A = 32'b01101011101000101101110001001010;
		B = 32'b00100101010100100101001001000101;
        func = 2'b11;

        #100
        	
		assert((Y === 32'b01101111111100101101111001001111) & (flags === 4'b0000))
        else $error("Failed");

		#100;

        //

    end

endmodule
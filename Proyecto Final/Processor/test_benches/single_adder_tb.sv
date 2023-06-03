module single_adder_tb;

    parameter integer N = 32;

    logic [N-1:0] A;
	logic [N-1:0] B;
	logic [N-1:0] Y;

    single_adder # (.N(N)) uut (.A(A),
                         .B(B),
                         .Y(Y));

    initial begin
		$display("single_adder Test Bench:\n");

		A = 0;
        B = 0;
        Y = 0;

		$monitor("A=%b B=%b Y=%b", A, B, Y);

	end

    initial	begin

		#100

        A <= 32'b11100101100111110001000000100000;
		B <= 32'b00000000000000000000000000000100;

        #100
        	
		assert((Y === 32'b11100101100111110001000000100100)) else $error("Failed");
	
		#100

        A <= 32'b01010000100111110001000000011000;
		B <= 32'b10001010111111111111111111111000;

        #100
        	
		assert((Y === 32'b11011011100111110001000000010000)) else $error("Failed");
	
		#100;

        // Done

    end

endmodule

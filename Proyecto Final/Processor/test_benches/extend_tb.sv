module extend_tb;

    parameter integer N = 24;

    logic [N-1:0] A;
	logic [1:0] S;
	logic [31:0] Y;

    extend # (.N(N)) uut (.A(A),
                          .S(S),
                          .Y(Y));

    initial begin
		$display("extend Test Bench:\n");

		A = 0;
        S = 0;
        Y = 0;

		$monitor("A=%b S=%b Y=%b", A, S, Y);

	end

    initial	begin

		#100

        A <= 24'b111010100001100010011010;
		S <= 2'b00;

        #100
        	
		assert((Y === 32'b00000000000000000000000010011010)) else $error("Failed");
	
		#100

        A <= 24'b111010100001100010011010;
		S <= 2'b01;

        #100
        	
		assert((Y === 32'b00000000000000000000100010011010)) else $error("Failed");
	
		#100

        A <= 24'b111010100001100010011010;
		S <= 2'b10;

        #100
        	
		assert((Y === 32'b11111111101010000110001001101000)) else $error("Failed");
	
		#100;

        // Done

    end

endmodule

/*
Test Bench para Decodificador 2 a 4
*/
module decoder_2to4_tb;

    logic [1:0]      A;
    logic       enable;

    logic          D0;
    logic          D1;
    logic          D2;
    logic          D3;

    decoder_2to4 uut (.A(A),
                      .enable(enable),
                      .D0(D0),
                      .D1(D1),
                      .D2(D2),
                      .D3(D3));

    initial begin
		$display("decoder_2to4 Test Bench:\n");

		A <= 2'b00;
		enable <= 0;

		$monitor("enable=%b\nA=%b: D0=%b D1=%b D2=%b D3=%b",
                  enable, A, D0, D1, D2, D3);
	end

    initial	begin
	
		#100

        enable = 1;

        #100

		A <= 2'b00;

		#100
		
		assert((D0 === 1) & (D1 === 0) & (D2 === 0) & (D3 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
		#100

		A <= 2'b01;

		#100
		
		assert((D0 === 0) & (D1 === 1) & (D2 === 0) & (D3 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
        #100

        A <= 2'b10;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 1) & (D3 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
        #100

        A <= 2'b11;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 1))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
        #100

        enable = 0;

        #100

        A <= 2'b11;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
        #100

        A <= 2'b00;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);

        #100;

        // Done
		
    end


endmodule

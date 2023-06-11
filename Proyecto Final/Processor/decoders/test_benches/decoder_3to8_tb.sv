/*
Test Bench para Decodificador 3 a 8
*/
module decoder_3to8_tb;

    logic [2:0]      A;
    logic       enable;

    logic          D0;
    logic          D1;
    logic          D2;
    logic          D3;
    logic          D4;
    logic          D5;
    logic          D6;
    logic          D7;

    decoder_3to8 uut (.A(A),
                      .enable(enable),
                      .D0(D0),
                      .D1(D1),
                      .D2(D2),
                      .D3(D3),
                      .D4(D4),
                      .D5(D5),
                      .D6(D6),
                      .D7(D7));

    initial begin

        $display("decoder_3to8 Test Bench:\n");

		A <= 3'b000;
		enable <= 0;

        $monitor("enable=%b\nA=%b: D0=%b D1=%b D2=%b D3=%b D4=%b D5=%b D6=%b D7=%b\n",
                  enable, A, D0, D1, D2, D3, D4, D5, D6, D7);
    end

    initial	begin
	
		#100

        enable = 1;

        #100

		A <= 3'b000;

		#100
		
		assert((D0 === 1) & (D1 === 0) & (D2 === 0) & (D3 === 0) &
               (D4 === 0) & (D5 === 0) & (D6 === 0) & (D7 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
		#100

        A <= 3'b001;

		#100
		
		assert((D0 === 0) & (D1 === 1) & (D2 === 0) & (D3 === 0) &
               (D4 === 0) & (D5 === 0) & (D6 === 0) & (D7 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
		#100

        A <= 3'b010;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 1) & (D3 === 0) &
               (D4 === 0) & (D5 === 0) & (D6 === 0) & (D7 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
		#100

        A <= 3'b011;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 1) &
               (D4 === 0) & (D5 === 0) & (D6 === 0) & (D7 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
		#100

        A <= 3'b100;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 0) &
               (D4 === 1) & (D5 === 0) & (D6 === 0) & (D7 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
		#100

        A <= 3'b101;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 0) &
               (D4 === 0) & (D5 === 1) & (D6 === 0) & (D7 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
		#100

        A <= 3'b110;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 0) &
               (D4 === 0) & (D5 === 0) & (D6 === 1) & (D7 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
		#100

        A <= 3'b111;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 0) &
               (D4 === 0) & (D5 === 0) & (D6 === 0) & (D7 === 1))
        else $error("Failed when A=%b with enable=%b", A, enable);
		
		#100

        enable = 0;

        #100

        A <= 3'b111;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 0) &
               (D4 === 0) & (D5 === 0) & (D6 === 0) & (D7 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);

        #100

        A <= 3'b100;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 0) &
               (D4 === 0) & (D5 === 0) & (D6 === 0) & (D7 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);

        #100

        A <= 3'b000;

		#100
		
		assert((D0 === 0) & (D1 === 0) & (D2 === 0) & (D3 === 0) &
               (D4 === 0) & (D5 === 0) & (D6 === 0) & (D7 === 0))
        else $error("Failed when A=%b with enable=%b", A, enable);

        #100;

    end

    // Done
							 
endmodule

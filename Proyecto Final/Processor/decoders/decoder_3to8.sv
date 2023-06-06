/*
Decodificador 3 a 8
*/
module decoder_3to8(A, enable,
                    D0, D1, D2, D3,
                    D4, D5, D6, D7);

	input  logic [2:0]      A;
    input  logic       enable;

    output logic          D0;
    output logic          D1;
    output logic          D2;
    output logic          D3;
    output logic          D4;
    output logic          D5;
    output logic          D6;
    output logic          D7;

    always_comb begin

        D0 = 1'b0;
        D1 = 1'b0;
        D2 = 1'b0;
        D3 = 1'b0;
        D4 = 1'b0;
        D5 = 1'b0;
        D6 = 1'b0;
        D7 = 1'b0;

        if (enable) begin

            case(A)

                3'b000: D0 = 1'b1;    

                3'b001: D1 = 1'b1;

                3'b010: D2 = 1'b1;

                3'b011: D3 = 1'b1;

                3'b100: D4 = 1'b1;    

                3'b101: D5 = 1'b1;

                3'b110: D6 = 1'b1;

                3'b111: D7 = 1'b1;

            endcase

        end

    end
	 
endmodule

/*
Decodificador 2 a 4
*/
module decoder_2to4(A, enable,
                    D0, D1, D2, D3);

	input  logic [1:0]      A;
    input  logic       enable;

    output logic          D0;
    output logic          D1;
    output logic          D2;
    output logic          D3;

    always_comb begin

        D0 = 1'b0;
        D1 = 1'b0;
        D2 = 1'b0;
        D3 = 1'b0;

        if (enable) begin

            case(A)

                2'b00: D0 = 1'b1;    

                2'b01: D1 = 1'b1;

                2'b10: D2 = 1'b1;

                2'b11: D3 = 1'b1;

            endcase

        end 
                
    end
	 
endmodule

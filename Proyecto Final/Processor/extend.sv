/*

Extend

*/
module extend
    #  (parameter N = 24)
	   (A, S, Y);

    input  logic [N-1:0] A;
    input  logic   [1:0] S;
	output logic  [31:0] Y;

    always @ (A, S) begin
        
        case (S)

            2'b00:   Y = {26'b0, A[7:0]};

            2'b01:   Y = {20'b0, A[11:0]};

            2'b10:   Y = {{A[23], A[23], A[23], A[23], A[23], A[23]},
                           A[23:0],
                           2'b00};

            default: Y = 32'b1111111111111111111111111111;

        endcase

    end 

endmodule

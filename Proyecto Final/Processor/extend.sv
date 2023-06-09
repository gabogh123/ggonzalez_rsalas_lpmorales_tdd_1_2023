/*

Extend

*/
module extend
    #  (parameter N = 24)
	   (A, S, Y);

    input  logic [N-1:0] A;
    input  logic   [1:0] S;
	output logic  [31:0] Y;

    logic  [3:0]    rot;
    logic  [7:0]  r_imm;

    logic [31:0] Y_temp;

    always @ (A, S) begin

        if (S == 2'b00) begin

            Y = {24'b0, A[7:0]};

        end else if (S == 2'b01) begin

            Y = {20'b0, A[11:0]};

        end else if (S == 2'b10) begin

            Y = {{A[23], A[23], A[23], A[23], A[23], A[23]},
                  A[23:0],
                  2'b00};

        end else if (S == 2'b11) begin

            /* 2'b11 : caso para rotar hacia la derecha el inmediato en MOV */

            Y_temp = {24'b0, A[7:0]};

            for (int i = 0; i < (A[11:8] * 2); i++) begin

                Y = {Y_temp[0], Y_temp[31:1]};

                Y_temp = Y;

            end

            Y = Y_temp;

        end else begin

            Y = 32'b1111111111111111111111111111;

        end

    end 

endmodule

module numbers_deco(
        input logic [11:0] matrix_num,
        output logic [3:0] num_id
    );

    always @(matrix_num) begin
        case (matrix_num)
            12'd0:  num_id = 4'd0;
            12'd2:  num_id = 4'd1;
            12'd4:  num_id = 4'd2;
            12'd8:  num_id = 4'd3;
            12'd16:  num_id = 4'd4;
            12'd32:  num_id = 4'd5;
            12'd64:  num_id = 4'd6;
            12'd128:  num_id = 4'd7;
            12'd256:  num_id = 4'd8;
            12'd512:  num_id = 4'd9;
            12'd1024:  num_id = 4'd10;
            12'd2048:  num_id = 4'd11;
            default: num_id = 4'd0;
        endcase
    end

endmodule
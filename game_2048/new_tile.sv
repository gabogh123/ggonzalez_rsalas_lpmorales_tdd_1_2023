module new_tile(
        input logic [11:0] matrix[3:0][3:0],
        input logic [3:0] position,
        output logic [11:0] updated_matrix[3:0][3:0]
    );

    logic [3:0] zero_count;
    integer i, j;
    
    always_comb begin
        zero_count = 0;
        for (i = 0; i < 4; i++) begin
            for (j = 0; j < 4; j++) begin
                if (matrix[i][j] == 0) begin
                    if (zero_count == position) begin
                        updated_matrix[i][j] <= 12'd2;
                        zero_count += 1;
                    end else begin
                        updated_matrix[i][j] <= matrix[i][j]; 
                        zero_count += 1;
                    end
                end else begin
                    updated_matrix[i][j] <= matrix[i][j]; 
                end
            end
        end
    end

endmodule

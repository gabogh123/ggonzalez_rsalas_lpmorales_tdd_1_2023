module new_tile(
        //input  logic        clk,
        input  logic        enable,
        input  logic [11:0] matrix [3:0][3:0],
        input  logic [3:0]  position,
        output logic [11:0] updated_matrix [3:0][3:0]
    );

    logic [3:0] zero_count;
    logic even_pos;
    assign odd_pos = position % 4'd2;
    integer i, j;

    //asssign 2 or 4 to n (position) zero in the matrix
    // if n is odd -> 4
    // else -> 2
    //always_ff @ (posedge clk) begin
	always_comb begin

        if (enable == 1) begin
            zero_count = 0;
            for (i = 0; i < 4; i++) begin
                for (j = 0; j < 4; j++) begin
                    if (matrix[i][j] == 0) begin
                        if (zero_count == position) begin
                            updated_matrix[i][j] <= odd_pos ? 12'd4 : 12'd2;
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
        
        end else begin

			updated_matrix = matrix;
            zero_count = 0;
            i = 0;
            j = 0;

		end

    end

endmodule

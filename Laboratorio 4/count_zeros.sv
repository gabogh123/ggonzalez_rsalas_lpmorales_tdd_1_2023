module count_zeros(
  input logic [11:0] matrix[3:0][3:0],
  output logic [3:0] zero_count
);

  integer i, j;
  
  always_comb begin
    zero_count = 0;
    for (i = 0; i < 4; i++) begin
      for (j = 0; j < 4; j++) begin
        if (matrix[i][j] == 0) begin
          zero_count += 1;
        end
      end
    end
  end

endmodule
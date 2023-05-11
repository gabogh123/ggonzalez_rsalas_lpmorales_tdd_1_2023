module new_tile_tb();

  logic [11:0] matrix[3:0][3:0];
  logic [11:0] updated_matrix[3:0][3:0];
  logic [3:0] position;
  
  new_tile dut (
    .matrix(matrix),
    .position(position),
    .updated_matrix(updated_matrix)
  );

  integer i;
  
  initial begin
    // Set up test case with 4 zeros
    matrix = '{'{1, 0, 1, 0}, '{0, 0, 1, 1}, '{1, 1, 0, 0}, '{0, 1, 0, 1}};
    position = 4'b0011;
    
    // Wait for output to stabilize
    #10;

    // Display matrix
    for (i = 0; i < 4; i++) begin
      $display("%d\t%d\t%d\t%d", updated_matrix[i][0], updated_matrix[i][1], updated_matrix[i][2], updated_matrix[i][3]);
    end
    
    // End simulation
    #5 $finish;
  end
  
endmodule


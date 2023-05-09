module count_zeros_tb;
  
  logic [11:0] matrix[3:0][3:0];
  logic [3:0] zero_count;
  
  count_zeros dut (
    .matrix(matrix),
    .zero_count(zero_count)
  );
  
  initial begin
    // Set up test case with 4 zeros
    matrix = '{'{1, 0, 1, 0}, '{0, 0, 1, 1}, '{1, 1, 0, 0}, '{0, 1, 0, 1}};
    
    // Wait for output to stabilize
    #10;
    
    // Check zero count
    if (zero_count !== 4'b0100) begin
      $error("Unexpected zero count: %b", zero_count);
    end else begin
      $display("Test passed!");
    end
    
    // End simulation
    #5 $finish;
  end
  
endmodule

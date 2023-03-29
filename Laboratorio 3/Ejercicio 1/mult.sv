module mult(input logic [M-1:0] a, b,
                         output logic [2*M-1:0] result);

  logic [M-1:0] product [0:M-1];
  logic [2*M-1:0] sum;

  // Generate partial products
  for (int i = 0; i < M; i++) begin
    for (int j = 0; j < M; j++) begin
      product[i][j+i] = a[i] & b[j];
    end
  end

  // Generate sum of partial products
  assign sum = product[0];
  for (int i = 1; i < M; i++) begin
    for (int j = 0; j < 2*M-i; j++) begin
      sum[j+i] = sum[j+i] ^ product[i][j];
    end
  end

  // Output result
  assign result = sum;

endmodule
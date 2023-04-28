module lfsr (
  input logic clk,
  input logic reset,
  output logic [3:0] rand_lfsr
);

  logic [3:0] lfsr_reg;

  always @(posedge clk) begin
    if (reset) begin
      lfsr_reg <= 4'hF;
    end else begin
      lfsr_reg <= {lfsr_reg[2:0], lfsr_reg[3] ^ lfsr_reg[2]};
    end
  end

  assign rand_lfsr = lfsr_reg;

endmodule

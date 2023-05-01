module lfsr (
  input logic trigger, reset,
  input logic [3:0] seed,
  output logic [3:0] rand_lfsr
);

  logic [3:0] lfsr_reg;

  always @(posedge trigger) begin
    if (reset) begin
      lfsr_reg <= seed;
    end else begin
      lfsr_reg <= {lfsr_reg[2:0], lfsr_reg[3] ^ lfsr_reg[2]};
    end
  end

  assign rand_lfsr = lfsr_reg;

endmodule

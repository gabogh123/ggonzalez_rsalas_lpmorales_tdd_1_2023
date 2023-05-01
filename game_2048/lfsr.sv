module lfsr (
  input logic trigger,
  input logic [2:0] Q,
  input logic [3:0] seed,
  output logic [3:0] rand_lfsr
);

  logic [3:0] lfsr_reg;
  logic rst;

  assign rst = ~Q[2] & ~Q[1] & Q[0]; // reset in state 001 

  always @(posedge trigger) begin
    if (rst) begin
      lfsr_reg <= seed;
    end else begin
      lfsr_reg <= {lfsr_reg[2:0], lfsr_reg[3] ^ lfsr_reg[2]};
    end
  end

  assign rand_lfsr = lfsr_reg;

endmodule

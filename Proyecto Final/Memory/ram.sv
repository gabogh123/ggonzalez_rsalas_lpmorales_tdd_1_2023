module ram (clk, enable, address, write_data );
  input logic 		 clk,
  input logic 		 enable,
  input logic [31:0] address,
  input logic [31:0] write_data,
  output logic [31:0] dataOut


  logic [31:0] memory [0:255]; // 256-byte memory

  always_ff @(posedge clk) begin
    if (enable) 
      memory[address] <= write_data;
  end

  always_comb begin
    dataOut = memory[address];
  end

endmodule
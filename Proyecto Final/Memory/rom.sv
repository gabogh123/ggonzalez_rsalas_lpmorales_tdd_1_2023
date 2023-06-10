module rom (
  input logic [7:0] address,
  output logic [7:0] dataOut
);


  logic [7:0] romContents [0:255] = '{256'h00, 256'h01, 256'h02, ...};

  assign dataOut = romContents[address];

endmodule
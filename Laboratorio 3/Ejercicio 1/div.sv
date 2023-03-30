module div
#(parameter M = 4)(
  input logic [2*M-1:0] A,
  input logic [M-1:0] B,
  output logic [M-1:0] R,
  output logic [M-1:0] Res,
  output				   C,
  output					N,
  output					V,
  output					Z
);
  logic [2*M-1:0] temp;
  logic [M-1:0] shift;
  
  assign temp = {A, {M{1'b0}}};
  
  always @(*) begin
    shift = 0;
    R = 0;
    for (int i = M-1; i >= 0; i--) begin
      shift = {shift[0], temp[i+M]};
      if (shift >= B) begin
        shift = shift - B;
        R[i] = 1;
      end
    end
    Res = shift;
  end
endmodule
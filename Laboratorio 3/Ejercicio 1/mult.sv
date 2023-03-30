module mult
	# (parameter M = 4)
     (input logic signed [M-1:0] A,
	   input logic signed [M-1:0] B,
	   output logic signed [2*M-1:0] R,
	   output				   C,
	   output					N,
	   output					V,
	   output					Z);

  logic signed [2*M-1:0] temp_R;
  
  integer i, j;

  always_comb begin
    temp_R = 0;
    for (i = 0; i < M; i++) begin
      if (B[i] == 1'b1) begin
        temp_R = temp_R + (A << i);
      end
    end
    R = temp_R;
	 
	 Z = ~(R || '0) && ~C;
	 
  end

endmodule

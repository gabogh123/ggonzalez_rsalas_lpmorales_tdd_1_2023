module resta 
#(parameter M = 4) (input logic [M - 1 : 0] A,
						  input logic [M - 1 : 0] B,
						  output logic cout,
						  output logic [M - 1 : 0] R,
						  output				   C,
						  output					N,
						  output					V,
						  output					Z);
logic [M : 0] cins;
assign cins[0] = 1'b1;

genvar i;
generate
for (i = 0; i < M; i += 1) begin : GenAdders
full_adder U1 (.A(A[i]), .B(~B[i] ), .cin(cins[i]), .cout(cins[i + 1]),
						.R(R[i]));

end
endgenerate 
assign cout = cins[M];

endmodule
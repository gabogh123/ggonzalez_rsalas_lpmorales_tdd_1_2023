module resta #(parameter M = 4) (
    input logic [M-1:0] A,
    input logic [M-1:0] B,
    output logic [M-1:0] R,
    output 					 C,
	 output					 N,
	 output					 V,
	 output					 Z
);

logic [M-1:0] not_B;
logic [M:0] temp;


// invert b bits
assign not_B = ~B;

// initialize borrow to 1
assign temp[0] = 1'b1;


// subtract each bit and propagate borrow
generate
    genvar i;
    for (i = 0; i < M; i++) begin : subtract_bit
        assign temp[i+1] = (A[i] & not_B[i]) | (~A[i] & not_B[i] & temp[i]);
        assign R[i] = A[i] ^ B[i] ^ temp[i];
    end
endgenerate

// borrow is the last carry out bit
assign C = temp[M];

endmodule	 
	 

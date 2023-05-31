/*

Adder

*/
module adder
    #  (parameter N = 32)
	   (A, B, Y);

    input  logic [N-1:0] A;
	input  logic [N-1:0] B;
	output logic [N-1:0] Y;

    // Hacerlo combinacional
    assign Y = A + B;

endmodule
/*

Testbech para la operacion Shift R

*/

module shiftr_tb;

	 parameter integer M = 4;
	 
    reg  [M-1:0] A, B;
	 
    wire [M-1:0] R;
	 wire C;
	 wire N;
	 wire V;
	 wire Z;
	 
	 shiftr # (.M(M)) uut (.A(A), .B(B), .R(R), 
									 .C(C), .N(N), .V(V), .Z(Z));
	 
	 initial begin
	 
		 A = 4'b1000; // shiftee
		 #10
		 
		 B = 4'b0000;
		 #10
		 B = 4'b0001;
		 #10
		 B = 4'b0010;
		 #10
		 B = 4'b0011;
		 #10
		 B = 4'b0100;
		 #10
		 B = 4'b0101;
		 #10;
	 
	 end
	 
endmodule

module resta_tb;

    parameter integer M = 4;
	 
    reg  [M-1:0] A, B;
	 
    wire [M-1:0] R;
	 wire 		  C;
	 wire  		  N;
	 wire 		  V;
	 wire			  Z;

	 resta # (.M(M)) uut (.A(A), .B(B), .R(R), 
									 .C(C), .N(N), .V(V), .Z(Z));
 
    initial begin
	 
		$monitor("A=%b B=%b R=%b C=%b N=%b V=%b Z=%b", A, B, R, C, N, V, Z);
	 
        A = 0100;
        B = 0010;
        #10
        A = 0010;
        B = 0100;
        #10
        A = 0001;
        B = 0001;
        #10
        A = 0111;
        B = 1111;
        #10
        A = 0000;
        B = 1111;
        #10
        A = 0110;
        B = 1111;
        #10
		  A = 1010;
        B = 0101;
        #10;  
		  
    end 
 
endmodule
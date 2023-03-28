// testbench for N-bit(in this case 8-bit) adder
module suma_tb;

    parameter integer M = 4;
	 
    reg  [M-1:0] A, B;
	 
    wire [M-1:0] R;

    //N_bit_adder 
	 suma # (.M(M)) uut(.A(A), .B(B), .R(R));
 
    initial begin
	 
        A = 0000;
        B = 0000;
        #10
        A = 0001;
        B = 0000;
        #10
        A = 0001;
        B = 0001;
        #10
        A = 0010;
        B = 0001;
        #10
        A = 0010;
        B = 0010;
        #10
        A = 0011;
        B = 0010;
        #10
		  A = 0011;
        B = 0011;
        #10
		  
		  A = 0100;
        B = 0100;
        #10
        A = 0101;
        B = 0100;
        #10
        A = 0101;
        B = 0101;
        #10
        A = 0110;
        B = 0101;
        #10
        A = 0110;
        B = 0110;
        #10
        A = 0111;
        B = 0110;
        #10
		  A = 0111;
        B = 0111;
        #10
		  
		  A = 1000;
        B = 1000;
        #10
        A = 1001;
        B = 1000;
        #10
        A = 1001;
        B = 1001;
        #10
        A = 1010;
        B = 1001;
        #10
        A = 1010;
        B = 1010;
        #10
        A = 1011;
        B = 1010;
        #10
		  A = 1011;
        B = 1011;
        #10
		  
		  A = 1100;
        B = 1100;
        #10
        A = 1101;
        B = 1100;
        #10
        A = 1101;
        B = 1101;
        #10
        A = 1110;
        B = 1101;
        #10
        A = 1110;
        B = 1110;
        #10
        A = 1111;
        B = 1110;
        #10
		  A = 1111;
        B = 1111;
        #10;
		  
    end 
 
endmodule

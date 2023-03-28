//the tech social
// testbench for N-bit(in this case 8-bit) adder
module N_bit_adder_tb;
    // parameter N = 8;
    reg [7:0] A, B;
    wire [7:0] R;
 

    N_bit_adder uut(.A(A), .B(B), .R(R));
 
    initial begin
        A = 0010;
        B = 1010;
        #100;
        A = 0001;
        B = 0001;
        #100;
        A = 0010;
        B = 0100;
        #100;
        A = 0100;
        B = 0010;
        #100;
        A = 0001;
        B = 0111;
        #100;
        A = 1110;
        B = 0001;
        #100;
		  A = 1110;
        B = 0011;
        #100;
    end 
 
endmodule
module mux2NtoN_tb;

	parameter integer M = 4;

	reg [M-1:0] I0;
	reg [M-1:0] I1;
	reg   	    S; 
	
	wire [M-1:0]  O;	

	mux_2NtoN # (.M(M)) m2NtoN_T (.I0(I0), .I1(I1), .S(S), .O(O));
	
	initial

	begin
	
		#5
		I0 <= 4'b0000; I1 <= 4'b1111; S <= 0;
		#5
	
		$monitor("I0=%b I1=%b S=%b O=%b", I0, I1, S, O);
		
		#40
		S <= 1;
		#40
		S <= 0;
		#40
		
		I0 <= 4'b1010; I1 <= 4'b0101; S <= 0;
		#40
		S <= 1;
		#40
		S <= 0;
		#40
		
		I0 <= 4'b0110; I1 <= 4'b1001; S <= 1;
		#40
		S <= 0;
		#40
		S <= 1;
		#40;
		
    end

endmodule
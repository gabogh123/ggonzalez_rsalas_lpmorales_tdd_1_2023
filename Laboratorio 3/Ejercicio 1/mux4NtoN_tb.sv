module mux4NtoN_tb;

	parameter integer M = 4;
	
	reg  [M-1:0]  I0;
	reg  [M-1:0]  I1;
	reg  [M-1:0]  I2;
	reg  [M-1:0]  I3;
	reg    [1:0]   S; 
	
	wire [M-1:0]   O;
	
	mux_4NtoN # (.M(M)) m4NtoN_T (.I0(I0), .I1(I1), .I2(I2), .I3(I3), .S(S), .O(O));
	
	initial

	begin
	
		#5
		I0 <= 4'b0000; I1 <= 4'b0001; I2 <= 4'b0010; I3 <= 4'b0011;
		#5
	
		$monitor("I0=%b I1=%b I2=%b I3=%b S=%b O=%b", I0, I1, I2, I3, S, O);
		
		#40
		S <= 2'b00;
		#40
		S <= 2'b01;
		#40
		S <= 2'b10;
		#40
		S <= 2'b11;
		#40
		
		#5
		I0 <= 4'b0000; I1 <= 4'b1000; I2 <= 4'b0100; I3 <= 4'b1100;
		#5
		
		#40
		S <= 2'b00;
		#40
		S <= 2'b01;
		#40
		S <= 2'b10;
		#40
		S <= 2'b11;
		#40;
		
    end

endmodule
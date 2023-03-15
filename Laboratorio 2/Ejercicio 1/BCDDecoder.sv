module BCDDecoder(a, b, c, d, y);

	input a, b, c, d;

	output reg [4:0]y;

	always @(a,b,c,d)
		
		begin
		
		if(a==1'b0 & b==1'b0 & c==1'b0 & d==1'b0) 
			y=5'b00000;
      else if(a==1'b0 & b==1'b0 & c==1'b0 & d==1'b1) 
			y=5'b00001;
      else if(a==1'b0 & b==1'b0 & c==1'b1 & d==1'b0) 
			y=5'b00010;
      else if(a==1'b0 & b==1'b0 & c==1'b1 & d==1'b1) 
			y=5'b00011;
		else if(a==1'b0 & b==1'b1 & c==1'b0 & d==1'b0) 
			y=5'b00100;
      else if(a==1'b0 & b==1'b1 & c==1'b0 & d==1'b1) 
			y=5'b00101;
      else if(a==1'b0 & b==1'b1 & c==1'b1 & d==1'b0) 
			y=5'b00110;
		else if(a==1'b0 & b==1'b1 & c==1'b1 & d==1'b1) 
			y=5'b00111;
      else if(a==1'b1 & b==1'b0 & c==1'b0 & d==1'b0) 
			y=5'b01000;
      else if(a==1'b1 & b==1'b0 & c==1'b0 & d==1'b1) 
			y=5'b01001;
		else if(a==1'b1 & b==1'b0 & c==1'b1 & d==1'b0) 
			y=5'b10000;
      else if(a==1'b1 & b==1'b0 & c==1'b1 & d==1'b1) 
			y=5'b10001;
      else if(a==1'b1 & b==1'b1 & c==1'b0 & d==1'b0) 
			y=5'b10010;
		else if(a==1'b1 & b==1'b1 & c==1'b0 & d==1'b1) 
			y=5'b10011;
      else if(a==1'b1 & b==1'b1 & c==1'b1 & d==1'b0) 
			y=5'b10100;
      else if(a==1'b1 & b==1'b1 & c==1'b1 & d==1'b1) 
			y=5'b10101;
		end
endmodule
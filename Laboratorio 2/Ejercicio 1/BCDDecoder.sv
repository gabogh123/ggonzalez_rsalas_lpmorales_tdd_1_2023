module BCDDecoder(input [3:0] w,
						output  [0:4] y);
						
		always @ (w)
		begin
		
			y = 5'b00000;
			
			if(w == 4'b0001)
				y = 5'b00001;
			else if(w == 4'b0010)
				y = 5'b00010;
			else if(w == 4'b0011)
				y = 5'b00011;
			else if(w == 4'b0100)
				y = 5'b00100;
			else if(w == 4'b0101)
				y = 5'b00101;
			else if(w == 4'b0110)
				y = 5'b00110;
			else if(w == 4'b0111)
				y = 5'b00111;
			else if(w == 4'b1000)
				y = 5'b01000;
			else if(w == 4'b1001)
				y = 5'b01001;
			else if(w == 4'b1010)
				y = 5'b10000;
			else if(w == 4'b1011)
				y = 5'b10001;
			else if(w == 4'b1100)
				y = 5'b10010;
			else if(w == 4'b1101)
				y = 5'b10011;
			else if(w == 4'b1110)
				y = 5'b10100;
			else if(w == 4'b1111)
				y = 5'b10101;
			else 
				y;
		end
endmodule

			
			
				
				
				
				


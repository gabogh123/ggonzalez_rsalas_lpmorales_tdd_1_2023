module BCDDecoder(input [3:0] w
						output reg [0:4] y);
						
		always @ (w)
		begin
		
			y = 5'b00000;
			
			if(w == 4'b0001)
				y[0] = 1'b1
			else if(w == 4'b0010)
				y[1] = 1'b1
			
				
				
				
				


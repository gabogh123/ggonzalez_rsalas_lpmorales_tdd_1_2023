module mux_2NtoN
	# (parameter M = 4)
	  (I0, I1, S, O);
	  
	input  logic [M-1:0] I0;
	input  logic [M-1:0] I1;
	input  logic          S; 
	
	output logic [M-1:0]  O;
	
	initial begin
	
		for (int j = 0; j < $size(I0); j++) begin
			
			O[j] = (I0[j] & ~S) | (I1[j] & S);
			
		end
	
	end 
	  
endmodule

module mux_2NtoN
	# (parameter M = 4)
	  (I0, I1, S, O);
	  
	input wire [M-1:0] I0;
	input wire [M-1:0] I1;
	input wire          S;
	
	output reg [M-1:0]  O;
	
	always @ (I0 or I1 or S) begin
	
		$display("I0 = %b", I0);
		$display("I1 = %b", I1);
	
		for (int i = 0; i < $size(I0); i++) begin
			
			O[i] = (I0[i] & ~S) | (I1[i] & S);
			
			$display("O[%d] = %b", i, O[i]);
			
		end
	
	end 
	  
endmodule

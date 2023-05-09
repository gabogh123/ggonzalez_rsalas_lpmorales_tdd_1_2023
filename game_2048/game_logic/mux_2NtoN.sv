module mux_2NtoN
	# (parameter N = 2)
	  (clk, I0, I1, S, O);
	
	input logic clk;
	input logic [N-1:0] I0;
	input logic [N-1:0] I1;
	input logic S;
	
	output logic [N-1:0]  O;
	
	always_ff @ (posedge clk) begin
	
		for (int i = 0; i < N; i++) begin
			
			O[i] = (I0[i] & ~S) | (I1[i] & S);
			
		end
	
	end 
	  
endmodule

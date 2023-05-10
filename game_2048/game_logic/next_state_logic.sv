/*
Next State for Game Logic FSM
*/
module next_state_logic(clk, enable, Q, M, S, D);

	input  logic clk, enable;
	input  logic [1:0] Q;
	input  logic 	   M;
	input  logic 	   S;
	output logic [1:0] D;

	always_ff @ (posedge clk) begin //posedge clk) begin
	
		if (enable) begin
			//D[1] = Q[1] | (Q[0] & S);
			D[1] = Q[1] | Q[0];
			//D[0] = (!Q[1] & M & !S) | (!Q[1] & Q[0] & !S);
			D[0] = !Q[1] & !Q[0];
		end else begin
			D = Q;
		end

	end


endmodule

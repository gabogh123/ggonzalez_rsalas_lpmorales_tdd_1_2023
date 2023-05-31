module ContadorReg(input reset,up_down, output[5:0] counter );

	reg [5:0] counter_up_down;

// down counter
always @(posedge reset)

	begin
	if(reset)
	 counter_up_down <= 6'b0;
	else if(~up_down)
	 counter_up_down <= counter_up_down + 4'b1;
	else
	 counter_up_down <= counter_up_down - 4'b1;
	end 

	assign counter = counter_up_down;

endmodule
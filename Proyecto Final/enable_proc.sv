module enable_proc(
		input logic btn, rst,
		output logic en
	);
	logic trigger;
	assign trigger = ~btn;

	always_ff @( posedge trigger, posedge rst) begin : enable
		if (rst)
			en = 0;
		else if (trigger)
			en = 1;
	end

endmodule

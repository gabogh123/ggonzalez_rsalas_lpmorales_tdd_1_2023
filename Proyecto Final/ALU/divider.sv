module divider #(parameter N = 8)(
		input logic [N-1:0] a,
		input logic [N-1:0] b,
		output logic [N-1:0] q, //quotient
		output logic [N-1:0] r, //remainder
		output logic [3:0] flags //3 = Negative, 2 = Zero, 1 = Carry, 0 = Overflow
	);
	
	logic [N:0][N-1:0] remainders, r_w0, r_w1, diff, a_aux;
	logic [N:0][3:0] f_w0, f_w1;
	assign remainders[N] = '0;

	genvar i;
	generate
		for (i = N-1; i >= 0; i--) begin : quotients_loop
			shift_1_bit #(N) mult_by_2(remainders[i+1], 1'b1, r_w0[i]); //remainders[i+1] << 1

			assign a_aux[i][0] = a[i];
			assign a_aux[i][N-1:1] = 0;
			adder #(N) adder_r_i (r_w0[i], a_aux[i], 0, r_w1[i], f_w0[i]); 

			subtractor #(N) sub_d_i (r_w1[i], b, diff[i], f_w1[i]);

			mux_2to1 #(1) mux_q(1'b1, 1'b0, f_w1[i][3], q[i]);
			mux_2to1 #(N) mux_r(diff[i], r_w1[i], f_w1[i][3], remainders[i]);

		end

	assign r = remainders[0];
	assign flags = 4'b0000;
	endgenerate

endmodule


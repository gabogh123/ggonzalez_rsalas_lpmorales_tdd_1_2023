module shift_1_bit #(parameter N = 8)(
		input logic [N-1:0] a,
		input logic d, // 0 >> right / 1 << left
		output logic [N-1:0] y
	);
		
		logic d_not;
		logic [(N-2)-1:0] w_0, w_1;
		
		not_gate not_d(d, d_not);

		and_gate and_msb(d_not,a[1],y[0]);

		genvar i;

		generate
			for (i = 0; i < N-2; i ++) begin : shift_loop
				and_gate and_w_i(a[i], d, w_0[i]);
				and_gate and_w_ip2(a[i+2], d_not, w_1[i]);

				or_gate or_w_i(w_0[i], w_1[i], y[i+1]);
			end
		endgenerate

		and_gate and_lsb(a[N-2],d,y[N-1]);
	
endmodule

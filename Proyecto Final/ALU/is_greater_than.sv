module is_greater_than #(parameter N = 8)(
        input logic [N-1:0] a, b,
        output logic gt
    );

    logic [N-1:0] a_gt_b, a_gt_b_bit, b_gt_a_bit, a_not, b_not, wire_0, wire_1;
    not_n_inputs #(N) not_a(a, a_not);
    not_n_inputs #(N) not_b(b, b_not);

    // Compare MSB
    and_gate a_gt_b_n(a[N-1], b_not[N-1], a_gt_b_bit[N-1]);
    assign a_gt_b[N-1] = a_gt_b_bit[N-1];
    and_gate b_gt_a_n(b[N-1], a_not[N-1], b_gt_a_bit[N-1]);

    genvar i;
    generate
        for (i = N - 2; i >= 0; i--) begin : a_gt_b_bitwise
            and_gate a_gt_b_i(a[i], b_not[i], a_gt_b_bit[i]);
            and_gate b_gt_a_i(b[i], a_not[i], b_gt_a_bit[i]);
				
				or_n_inputs #(N-i) or_b_gt_a(b_gt_a_bit[N-1:i],wire_0[i]);
				not_gate nor_b_gt_a(wire_0[i], wire_1[i]);
				
				and_gate and_a_gt_b(a_gt_b_bit[i], wire_1[i], a_gt_b[i]);

        end
    endgenerate

    or_n_inputs #(N) or_a_gt_b(a_gt_b, gt);

endmodule

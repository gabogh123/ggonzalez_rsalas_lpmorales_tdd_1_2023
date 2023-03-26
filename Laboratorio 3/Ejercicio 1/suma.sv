module suma

#(parameter N = 4)
(
    input [N-1:0] a, b,
    output [N-1:0] result
);
    wire [N-1:0] carry;
    wire carry_out;
    genvar i;
 
    generate
      for (i = 0; i < N; i = i + 1) begin: generate_suma
        if (i == 0) 
          half_adder b(a[0], b[0], result[0], carry[0]);
        else 
          full_adder b(a[i], b[i], carry[i-1], result[i], carry[i]);
      end  
 
        assign carry_out = carry[N-1];
    endgenerate
endmodule
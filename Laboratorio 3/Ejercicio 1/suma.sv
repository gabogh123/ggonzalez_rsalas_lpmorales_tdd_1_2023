module suma
#(parameter N = 4)
(
    input [N-1:0] input1, input2,
    output [N-1:0] answer
);
    wire [N-1:0] carry;// intermediate carry outputs
    wire carry_out;// for the end carry output
    genvar i;// general variable
 
    generate
      for (i = 0; i < N; i = i + 1) begin: generate_suma
        if (i == 0) // LSB bit adder
          half_adder b(input1[0], input2[0], answer[0], carry[0]);
        else // rest all adders
          full_adder b(input1[i], input2[i], carry[i-1], answer[i], carry[i]);
      end  
 
        assign carry_out = carry[N-1];
    endgenerate
endmodule
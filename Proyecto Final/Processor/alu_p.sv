/*
ALU especifica para las funciones del procesador

Operaciones:		|			Flags:
0. 00 = sum			|			0001: oVerflow
1. 01 = sub			|			0010: Carry
2. 10 = and			|			0100: Zero
3. 11 = or			|			1000: Negative
*/
module alu_p
    #  (parameter N = 32)
       (A, B, func, Y, flags);

    input  logic [N-1:0]     A;
	input  logic [N-1:0]     B;
	input  logic   [1:0]  func;
	output logic [N-1:0]     Y;
	output logic   [3:0] flags; /* N Z C V */

    // Results
    logic [N-1:0] y_adder;      //00
    logic [N-1:0] y_subtractor; //01
    logic [N-1:0] y_and;        //10
    logic [N-1:0] y_or;         //11

    // Flags
    logic [3:0] f_adder;
    logic [3:0] f_subtractor;
    logic [3:0] f_and;
    logic [3:0] f_or;

    // Operations
    adder 	    # (.N(N)) alu_adder		 (A, B, 1'b0, y_adder, f_adder);
	subtractor  # (.N(N)) alu_subtractor (A, B, y_subtractor, f_subtractor);
    and_bitwise # (.N(N)) alu_and		 (A, B, y_and);
	or_bitwise  # (.N(N)) alu_or		 (A, B, y_or);


    /* Results MUX */
    mux_4NtoN # (.N(N)) m4NtoN_result (.I0(y_adder),
							           .I1(y_subtractor),
							           .I2(y_and),
							           .I3(y_or),
							           .enable(1'b1),
							           .S(func),
							           .O(Y));

    /* Flags MUX */
    mux_4NtoN # (.N(4)) m4NtoN_flags (.I0(f_adder),
							          .I1(f_subtractor),
							          .I2(4'b0000),
							          .I3(4'b0000),
							          .enable(1'b1),
							          .S(func),
							          .O(flags));                             

endmodule

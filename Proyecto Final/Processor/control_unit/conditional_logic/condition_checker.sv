/*
Condition Checker del Conditional Logic del Control Unit
Logica basada en la tabla de condiciones de la tabla 6.3 del libro
Digital Design and Computer Architecture ARM Editon
de Sarah L. Harries & David Money Harries.
*/
module condition_checker(cond, N, Z, C, V, cond_ex);

    input logic [3:0] cond;
    input logic N;
    input logic Z;
    input logic C;
    input logic V;

    output logic cond_ex;

    always_comb begin
        
        case (cond)

            /* EQ -> Equal */
            4'b0000:    cond_ex = Z;

            /* NE -> Not equal */
            4'b0001:    cond_ex = ~Z;

            /* CS/HS -> Carry set / unsigned higher or same */
            4'b0010:    cond_ex = C;

            /* CC/LO -> Carry clear / usigned lower */
            4'b0011:    cond_ex = ~C;

            /* MI -> Minus / negative */
            4'b0100:    cond_ex = N;

            /* PL -> Plus / positive or zero */
            4'b0101:    cond_ex = ~N;

            /* VS -> Overflow / overflow set */
            4'b0110:    cond_ex = V;

            /* VC -> No overflow / overflow clear */
            4'b0111:    cond_ex = ~V;

            /* HI -> Usigned higher */
            4'b1000:    cond_ex = ~Z & C;

            /* LS -> Usigned lower o same */
            4'b1001:    cond_ex = Z | ~C;

            /* GE -> Signed greater than or equal */
            4'b1010:    cond_ex = ~(N ^ V);

            /* LT -> Signed less than */
            4'b1011:    cond_ex = (N ^ V);

            /* GT -> Signed greater than */
            4'b1100:    cond_ex = ~Z & ~(N ^ V);

            /* LE -> Signed less than or equal */
            4'b1101:    cond_ex = Z | (N ^ V);

            /* AL -> Always / unconditional */
            4'b1110:    cond_ex = 1;

            default: cond_ex = 1;

        endcase

    end 

endmodule

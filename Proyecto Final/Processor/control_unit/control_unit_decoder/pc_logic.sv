/*
PC Logic del Decoder del Control Unit
Logica basada del libro
Digital Design and Computer Architecture ARM Editon
de Sarah L. Harries & David Money Harries.

PCS = [ (Rd == 15) & REG_W ] | Branch 
*/
module pc_logic(rd, branch, reg_w, pcs);

    input  logic [3:0]     rd;
    input  logic       branch;
    input  logic        reg_w;

    output logic          pcs;

    always_comb begin 
    
        if (((rd == 4'b1111) & branch) | reg_w)
            pcs = 1;
        else 
            pcs = 0;

    end

endmodule

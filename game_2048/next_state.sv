module next_state(
        input logic [2:0] Q,
        input logic buttons, won, lost, rst,
        output logic [2:0] D
    );

    // always @(buttons) begin
    //     case (Q)
    //         3'b000: D = ~buttons[0] ? 3'b001 : 3'b000;
    //         3'b001: D = 3'b010;
    //         3'b010: D = 3'b011;
    //         3'b011: D = ~buttons[0] ? 3'b100 : 3'b011;
    //         3'b100: D = ~buttons[0] ? 3'b000 : 3'b100;
    //         default: D = 3'b000; 
    //     endcase
    // end

    
    always @(posedge buttons, posedge rst) begin
        if (rst)
            D = 3'b000;
        else begin 
            D[2] = Q[2] | (Q[1] & Q[0] & ~won & lost) | (Q[1] & Q[0] & won & ~lost);
            D[1] = (Q[1] & ~Q[0]) | (Q[1] & ~won & ~lost) | (Q[1] & won & lost) | (~Q[2] & ~Q[1] & Q[0] & buttons);
            D[0] = (Q[2] & Q[0]) | (~Q[2] & ~Q[0] & buttons) | (Q[1] & Q[0] & lost) | (~Q[1] & Q[0] & ~buttons);
        end
    end

endmodule
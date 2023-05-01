module next_state(
        input logic [2:0] Q,
        input logic buttons, won, lost, rst,
        output logic [2:0] D
    );

    always @(posedge buttons) begin
        D[2] = Q[2] | (Q[1] & Q[0] & ~won & lost) | (Q[1] & Q[0] & won & ~lost);
        D[1] = (Q[1] & ~Q[0]) | (Q[1] & ~won & ~lost) | (Q[1] & won & lost) | (~Q[2] & ~Q[1] & Q[0] & buttons);
        D[0] = (Q[2] & Q[0]) | (~Q[2] & ~Q[0] & buttons) | (Q[1] & Q[0] & lost) | (~Q[1] & Q[0] & ~buttons);
    end

endmodule
module next_state(
        input logic [2:0] Q,
        input logic buttons, won, lost, rst,
        output logic [2:0] D
    );

    always @(posedge buttons, posedge rst) begin
        if (rst)
            D = 3'b000;
        else if (buttons) begin
            D[2] = (Q[1] & ~won & lost) | (Q[1] & Q[0] & won & ~lost);
            D[1] = (~Q[1] & Q[0] & buttons) | (Q[1] & ~Q[0] & ~lost) | (Q[1] & ~won & ~lost) | (Q[1] & won & lost);
            D[0] = (~Q[0] & buttons) | (Q[1] & Q[0] & lost) | (~Q[1] & Q[0] & ~buttons) | (Q[1] & ~won & lost);
        end
    end

endmodule
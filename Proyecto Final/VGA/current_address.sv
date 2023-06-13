module current_address(
        input clk, rst, enable,
        input logic [31:0] D,
        output logic [31:0] Q
    );

    logic [31:0] regs;

    always_ff @( posedge clk, posedge rst ) begin : ff_address
        if (rst) begin
            if (enable)
                // regs <= 31'h3a4;
                regs <= 31'h39c;
        end
        else if (clk) begin
            if (enable)
                regs <=  D;
        end
    end

    assign Q = regs;
endmodule

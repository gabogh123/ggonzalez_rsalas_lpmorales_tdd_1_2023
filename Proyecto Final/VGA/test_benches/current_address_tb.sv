module current_address_tb();

    logic clk, rst, en;
    logic [31:0] D, Q;

    current_address dut(clk, rst, en, D, Q);

    always #10 clk = ~clk; //50MHz clock
    initial begin
        en <= 1;
        clk <= 0;
        rst <= 1;
        #20;
        rst <= 0;
        
        D <= 32'h39c;

        repeat (10) begin
            #20;
            $display("Q = %h", Q);
            D = D + 4;
        end
        en <= 0;
        #20
        D <= D + 4;
        #20
        $display("Q = %h", Q);
        $finish;

    end


endmodule

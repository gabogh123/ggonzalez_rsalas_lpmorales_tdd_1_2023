module address_enable_tb();
    logic [9:0] x, y;
    logic en;
    address_enable dut(x, y, en);
    
    initial begin
        x <= 10'hff;
        y <= 10'hff;
        #10;

        x <= 10'h100;
        y <= 10'hff;
        #10;

        x <= 10'hff;
        y <= 10'h100;
        #10;

        x <= 10'h10;
        y <= 10'hff;
        #10;
    end

endmodule

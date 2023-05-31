module clock_divider_tb();

    logic clk_50Mhz, clk_25Mhz, rst;

    clock_divider dut(clk_50Mhz, rst, clk_25Mhz);

    always #10 clk_50Mhz=~clk_50Mhz; //clock flips value every 10ns -> time period = 20ns -> freq = 50 MHz

    initial begin
        clk_50Mhz <= 0;

        rst <= 1;
        #10;
        rst <= 0;

        #100;
        $finish;
    end

endmodule

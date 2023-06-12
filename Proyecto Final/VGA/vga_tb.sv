`timescale 1 ps / 1 ps
module vga_tb();

    logic clk;
    logic [31:0] addr;
    logic [31:0] data;

    vga dut(clk, addr, data);

    always #10 clk = ~clk; //50MHz clock

    initial begin
        clk <= 0;
        addr <= 32'h4;
        #20;
        $display("Address: %h \nData: %h", addr, data);
        
        addr <= 32'h39c;
        #20;
        $display("\nAddress: %h \nData: %h", addr, data);

        addr <= addr + 32'h4;
        #20;
        $display("\nAddress: %h \nData: %h", addr, data);
        
        addr <= addr + 32'h4;
        #20;
        $display("\nAddress: %h \nData: %h", addr, data);

        #100
        $finish;
    end

endmodule

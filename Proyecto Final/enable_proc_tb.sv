module enable_proc_tb();
    logic btn, rst, en;
    enable_proc dut(btn, rst, en);
    initial begin
        rst <= 0;
        btn <= 1;

        #10;
        rst <= 1;
        #10;
        rst <= 0;
        #10; 
        btn <= 0;
        #10;
        btn <= 1;
    end
endmodule

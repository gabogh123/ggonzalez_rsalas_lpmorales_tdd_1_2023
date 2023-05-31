module greater_tb();
    logic [11:0] a,b,c;

    greater dut(a,b,c);

	initial begin
        a <= 12'd4;
        b <= 12'd8;

        #10
        assert (c === 12'd8) 
        else   $error("failed a = %d, b = %d, c = %d", a, b, c);
    end
endmodule

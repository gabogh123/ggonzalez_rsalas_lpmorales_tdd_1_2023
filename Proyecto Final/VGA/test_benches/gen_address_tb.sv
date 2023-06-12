module gen_address_tb();

    logic en;
    logic [31:0] addr, offset;
    logic [9:0] x,y;

    gen_address dut(en, x, y, offset, addr);

    initial begin
        // en <= 1;
        // offset <= 32'h9fffc;
        en <= 0;
        offset <= 32'h39c;
        x <= 10'h0;
        y <= 10'h0;
        #10;
        $display("x = %h\ty = %h\taddr = %h", x, y, addr);
        
        //x <= x + 1;
        y <= y + 1;
        #10;
        $display("x = %h\ty = %h\taddr = %h", x, y, addr);
        
        //x <= x + 1;
        y <= y + 1;
        #10;
        $display("x = %h\ty = %h\taddr = %h", x, y, addr);
        
        //x <= x + 1;
        y <= y + 1;
        #10;
        $display("x = %h\ty = %h\taddr = %h", x, y, addr);
        
        y <= y + 1;
        #10;
        $display("x = %h\ty = %h\taddr = %h", x, y, addr);
        
        x <= x + 1;
        y <= 10'h0;
        #10;
        $display("x = %h\ty = %h\taddr = %h", x, y, addr);

        y <= y + 1;
        #10;
        $display("x = %h\ty = %h\taddr = %h", x, y, addr);

        $finish;
    end

endmodule

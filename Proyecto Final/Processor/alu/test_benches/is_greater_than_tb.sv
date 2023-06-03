module is_greater_than_tb();

	logic [7:0] a, b;
    logic y;

    is_greater_than #(8) dut_gt(a, b, y);

    initial begin

        a <= 8'b00000001;
        b <= 8'b00000000;
        #2
        assert(y === 1) else $error("failed for a = %b, b = %b", a, b);
        
        a <= 8'b00010000;
        b <= 8'b00001111;
        #2
        assert(y === 1) else $error("failed for a = %b, b = %b", a, b);
        
        a <= 8'b00000001;
        b <= 8'b00001000;
        #2
        assert(y === 0) else $error("failed for a = %b, b = %b", a, b);
        
        a <= 8'b00001111;
        b <= 8'b00010000;
        #2
        assert(y === 0) else $error("failed for a = %b, b = %b", a, b);
        
        a <= 8'b00001111;
        b <= 8'b00001111;
        #2
        assert(y === 0) else $error("failed for a = %b, b = %b", a, b);

		  
    $finish;
    end
endmodule
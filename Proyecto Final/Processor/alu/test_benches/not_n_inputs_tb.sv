module not_n_inputs_tb();
	logic [7:0] a,y;
    
    not_n_inputs #(8) dut_not(a, y);

    initial begin

        a <= 8'b00000001;
        #2
        assert(y === 8'b11111110) else $error("failed for a = %b", a);
        
    $finish;
    end
endmodule

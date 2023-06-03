module or_n_inputs_tb();

    logic [7:0] or_input;
    logic y;

    or_n_inputs #(8) dut_or(or_input, y);

    initial begin
        or_input <= 8'b00000001;
        #2
        assert(y === 1) else $error("failed or inputs = %b", or_input);
		  
		  or_input <= 8'b00000010;
        #2
        assert(y === 1) else $error("failed or inputs = %b", or_input);
		  
		  or_input <= 8'b00000100;
        #2
        assert(y === 1) else $error("failed or inputs = %b", or_input);
		  
		  or_input <= 8'b00001000;
        #2
        assert(y === 1) else $error("failed or inputs = %b", or_input);
		  
		  or_input <= 8'b00010000;
        #2
        assert(y === 1) else $error("failed or inputs = %b", or_input);
		  
		  or_input <= 8'b00100000;
        #2
        assert(y === 1) else $error("failed or inputs = %b", or_input);
		  
		  or_input <= 8'b01000000;
        #2
        assert(y === 1) else $error("failed or inputs = %b", or_input);
		  
		  or_input <= 8'b10000000;
        #2
        assert(y === 1) else $error("failed or inputs = %b", or_input);

		  or_input <= 8'b00000000;
        #2
        assert(y === 0) else $error("failed or inputs = %b", or_input);
		  
    $finish;
    end
endmodule



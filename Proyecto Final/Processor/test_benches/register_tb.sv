module register_tb;

    parameter integer N = 32;

    logic clk;
    logic rst;
    logic en;
    logic [N-1:0]   D;
	logic [N-1:0]   Q;

    register # (.N(N)) uut (.clk(clk),
                            .rst(rst),
                            .en(en),
                            .D(D),
                            .Q(Q));

    initial begin
		$display("register Test Bench:\n");

		clk = 0;
		rst = 0;
        en = 0;
		D <= 32'b0;

		$monitor("rst=%b D=%b Q=%b", rst, D, Q);
	end

    always begin
		#50 clk = !clk;
	end

    initial	begin

		#100

        rst = 1;
        en = 0;

        #100

        rst = 0;
        en = 1;

        #100

		D <= 32'b11100001101000000010000010100010;

		#25

        assert((Q === 32'b0)) else $error("Failed");

        #75
        
		assert((Q === 32'b11100001101000000010000010100010)) else $error("Failed");
		
		#100
		
		D <= 32'b10101010000000000000000000000100;

		#25

        assert((Q === 32'b11100001101000000010000010100010)) else $error("Failed");

        #75
		
		assert((Q === 32'b10101010000000000000000000000100)) else $error("Failed");
		
		#100

        rst = 1;
        D <= 32'b0;

        #100

        assert((Q === 32'b0)) else $error("Failed");

        #100

        rst = 0;
        en = 0;

        #100

		D <= 32'b11100001101000000010000010100010;

		#25

        assert((Q === 32'b0)) else $error("Failed");

        #75
        
		assert((Q === 32'b0)) else $error("Failed");

        #100;

        // Done
		
    end

    initial
	#1000 $finish;

endmodule

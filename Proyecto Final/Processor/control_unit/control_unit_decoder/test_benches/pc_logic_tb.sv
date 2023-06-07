/*
Test Bench de PC Logic del Decoder del Control Unit
*/
module pc_logic_tb;

    logic [3:0]     rd;
    logic       branch;
    logic        reg_w;
    logic          pcs;

    pc_logic uut (.rd(rd),
                  .branch(branch),
                  .reg_w(reg_w),
                  .pcs(pcs));

    initial begin
		$display("pc_logic Test Bench:\n");

		rd <= 4'b0000;
		branch <= 0;
		reg_w <= 0;

		$monitor("rd=%b branch=%b reg_w=%b\n", rd, branch, reg_w,
                 "PCS = %b", pcs);
	end

    initial	begin
	
		#100

		rd = 4'b1100;
		branch = 0;
		reg_w = 0;

		#100

        assert((pcs === 0))
		else $error("Failed @ rd=%b branch=%b reg_w=%b", rd, branch, reg_w);

        #100

        rd = 4'b1111;
		branch = 0;
		reg_w = 0;

		#100

        assert((pcs === 0))
		else $error("Failed @ rd=%b branch=%b reg_w=%b", rd, branch, reg_w);

        #100

        rd = 4'b1010;
		branch = 1;
		reg_w = 0;

		#100

        assert((pcs === 0))
		else $error("Failed @ rd=%b branch=%b reg_w=%b", rd, branch, reg_w);

        #100

        rd = 4'b1111;
		branch = 1;
		reg_w = 0;

		#100

        assert((pcs === 1))
		else $error("Failed @ rd=%b branch=%b reg_w=%b", rd, branch, reg_w);

        #100

        rd = 4'b1111;
		branch = 1;
		reg_w = 1;

		#100

        assert((pcs === 1))
		else $error("Failed @ rd=%b branch=%b reg_w=%b", rd, branch, reg_w);

        #100

        rd = 4'b0000;
		branch = 0;
		reg_w = 1;

		#100

        assert((pcs === 1))
		else $error("Failed @ rd=%b branch=%b reg_w=%b", rd, branch, reg_w);

        #100;

        // Done

    end

endmodule

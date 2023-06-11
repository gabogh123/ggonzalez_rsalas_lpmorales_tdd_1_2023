/*
Test Bench de conditional_logic del Control Unit
*/
module conditional_logic_tb;

    logic             clk;
    logic             rst;
    logic [3:0]      cond;
    logic [3:0] alu_flags;

    logic [1:0]    flag_w;
    logic             pcs;
    logic           reg_w;
    logic           mem_w;
    logic        no_write;

    logic          pc_src;
    logic       reg_write;
    logic       mem_write;

    logic flag_write;
    logic cond_ex;
    logic [3:0] flags_for_check;

    conditional_logic uut (.clk(clk),
                           .rst(rst),
                           .cond(cond),
                           .alu_flags(alu_flags),
                           .flag_w(flag_w),
                           .pcs(pcs),
                           .reg_w(reg_w),
                           .mem_w(mem_w),
                           .no_write(no_write),
                           .pc_src(pc_src),
                           .reg_write(reg_write),
                           .mem_write(mem_write));
    
    initial begin
		$display("conditional_logic Test Bench:\n");

        clk <= 0;
		rst <= 0;

        cond <= 4'b0000;
        alu_flags <= 4'b0000;

		flag_w <= 2'b00;
        pcs <= 1'b0;
        reg_w <= 1'b0;
		mem_w <= 1'b0;
        no_write <= 1'b0;

		$monitor("Control_unit's Processor Inputs:       ",
                 "cond=%b ",                    cond,
                 "alu_flags=%b\n",              alu_flags,
                 "Control_unit_decoder's Inputs:         ",
                 "flag_w=%b ",                  flag_w,
                 "pcs=%b ",                     pcs,
                 "reg_w=%b ",                   reg_w,
                 "mem_w=%b ",                   mem_w,
                 "no_write=%b\n",               no_write,
                 "Internal Signals:                      ",
                 "flag_write=%b ",              uut.flag_write,
                 "cond_ex=%b ",                 uut.cond_ex,
                 "flags_for_check=%b\n",        uut.flags,
                 "Control_unit's Processor Outputs:      ",
                 "pc_src=%b ",                  pc_src,
                 "reg_write=%b ",               reg_write,
                 "mem_write=%b\n",              mem_write);
	end

    always begin
		#50 clk = !clk;
        flag_write = uut.flag_write;
        cond_ex = uut.cond_ex;
        flags_for_check = uut.flags;
	end

    initial	begin

		#100

        rst = 1;

        #100

        rst = 0;

        #100

        $display("cond: unconditional, no flags");
        cond <= 4'b1110;
        alu_flags <= 4'b0000;

		flag_w <= 2'b00;
        pcs <= 1'b1;
        reg_w <= 1'b1;
		mem_w <= 1'b0;
        no_write <= 1'b0;

        #100

        $display("cond: unconditional, N=0 Z=1 C=0 V=0");
        cond <= 4'b1110;
        alu_flags <= 4'b0100;

		flag_w <= 2'b11;
        pcs <= 1'b1;
        reg_w <= 1'b1;
		mem_w <= 1'b0;
        no_write <= 1'b0;

        #100

        $display("cond: EQ, last flags: N=0 Z=1 C=0 V=0");
        cond <= 4'b0000;
        alu_flags <= 4'b0000;

		flag_w <= 2'b11;
        pcs <= 1'b1;
        reg_w <= 1'b1;
		mem_w <= 1'b1;
        no_write <= 1'b0;

        #25

        assert((cond_ex === 1) & (pc_src === 1) & (reg_write === 1) & (mem_write === 1))
		else $error("Failed @ cond=%b alu_flags=%b", cond, alu_flags);

        #100

        $display("cond: EQ, last flags N=0 Z=0 C=0 V=0");
        cond <= 4'b0000;
        alu_flags <= 4'b1111;

		flag_w <= 2'b00;
        pcs <= 1'b1;
        reg_w <= 1'b1;
		mem_w <= 1'b0;
        no_write <= 1'b0;

        #25

        assert((cond_ex === 0) & (pc_src === 0) & (reg_write === 0) & (mem_write === 0))
		else $error("Failed @ cond=%b alu_flags=%b", cond, alu_flags);

        #100




        #100;

    end



    initial
	#1000 $finish;

endmodule

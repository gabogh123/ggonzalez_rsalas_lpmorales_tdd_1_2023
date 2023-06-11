/*
Test Bench de control_unit_decoder del Control Unit
*/
module control_unit_decoder_tb;

    logic clk;

    logic [1:0]          op;
    logic [5:0]       funct;
    logic [3:0]          rd;

    logic [1:0]      flag_w;
    logic               pcs;
    logic             reg_w;
    logic             mem_w;
    logic          no_write;

    logic        mem_to_reg;
    logic         alu_src_a;
    logic         alu_src_b;
    logic [1:0]     imm_src;
    logic [1:0]     reg_src;
    logic [1:0] alu_control;

    logic branch;
    logic alu_op;

    control_unit_decoder uut (.op(op),
                              .funct(funct),
                              .rd(rd),
                              .flag_w(flag_w),
                              .pcs(pcs),
                              .reg_w(reg_w),
                              .mem_w(mem_w),
                              .no_write(no_write),
                              .mem_to_reg(mem_to_reg),
                              .alu_src_a(alu_src_a),
                              .alu_src_b(alu_src_b),
                              .imm_src(imm_src),
                              .reg_src(reg_src),
                              .alu_control(alu_control));
    
    initial begin
		$display("control_unit_decoder Test Bench:\n");

        op = 2'b00;
		funct <= 6'b000000;
        rd = 4'b0000;

		$monitor("Control_unit's Processor Inputs:      ",
                 "op=%b ",              op,
                 "funct=%b [I=%b, cmd=%b, S=%b] ", funct, funct[5], funct[4:1], funct[0],
                 "rd=%b \n",             rd,
                 "Internal Signals:                     ",
                 "branch=%b ",          uut.w_branch,
                 "alu_op=%b\n",         uut.w_alu_op,
                 "Outputs Towards Conditional Logic:    ",
                 "flag_w=%b ",          flag_w,
                 "pcs=%b ",             pcs,
                 "reg_w=%b ",           reg_w,
                 "mem_w=%b ",           mem_w,
                 "no_write=%b\n",       no_write,
                 "Control_unit's Processor Outputs:    ",
                 "mem_to_reg=%b ",      mem_to_reg,
                 "alu_src_a=%b ",       alu_src_a,
                 "alu_src_b=%b ",       alu_src_b,
                 "imm_src=%b ",         imm_src,
                 "reg_src=%b ",         reg_src,
                 "alu_control=%b\n",    alu_control);
	end

    always begin
		#50 clk = !clk;
        branch = uut.w_branch;
        alu_op = uut.w_alu_op;
	end

    initial	begin
	
		#100

        $display(" ** Data Processing Register, ADD cmd, no S ** ");
        op = 2'b00;
		funct = {1'b0, 4'b0100, 1'b0};  // { I ,  cmd  , S }
		rd = 4'b0000;

		#100

        $display(" ** Data Processing Register, ADD cmd, with S ** ");
        op = 2'b00;
		funct = {1'b0, 4'b0100, 1'b1};  // { I ,  cmd  , S }
		rd = 4'b0000;

		#100




        #100;

    end

    initial
	#1000 $finish;

endmodule

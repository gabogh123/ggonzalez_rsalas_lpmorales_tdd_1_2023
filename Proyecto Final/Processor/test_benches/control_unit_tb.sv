/*
Test Bench del Control Unit
*/
module control_unit_tb;

    logic               clk;
    logic               rst;

    logic [31:0] instruction;

    logic [3:0]        cond; // instruction[31:28]
    logic [3:0]       flags; // from alu 4'b

    logic [1:0]          op; // instruction[27:26]
    logic [5:0]       funct; // instruction[25:20]
    logic [3:0]          rd; // instruction[15:12]

    logic            pc_src;
    logic         reg_write;
    logic         mem_write;

    logic        mem_to_reg;
    logic         alu_src_a;
    logic         alu_src_b;
    logic [1:0]     imm_src;
    logic [1:0]     reg_src;
    logic [1:0] alu_control;

    // internal control_unit
    logic [1:0]      flag_w;
    logic               pcs;
    logic             reg_w;
    logic             mem_w;
    logic          no_write;

    // internal control_unit_decoder
    logic branch;
    logic alu_op;

    // internal conditional_logic
    logic flag_write;
    logic cond_ex;
    logic [3:0] flags_for_check;


    control_unit uut (.clk(clk),
					  .rst(rst),
					  .cond(cond),
					  .op(op),
					  .funct(funct),
					  .rd(rd),
					  .flags(flags),
					  .pc_src(pc_src),
					  .mem_to_reg(mem_to_reg),
					  .mem_write(mem_write),
					  .alu_control(alu_control),
					  .alu_src_a(alu_src_a),
                      .alu_src_b(alu_src_b),
					  .imm_src(imm_src),
					  .reg_write(reg_write),
					  .reg_src(reg_src));

    initial begin
		$display("control_unit Test Bench:\n");

        clk <= 0;
		rst <= 0;

        instruction <= 32'b0;

        cond <= 4'b0000;
        flags <= 4'b0000;

        op = 2'b00;
		funct <= 6'b000000;
        rd = 4'b0000;

		$monitor("\nInputs Towards Conditional_logic:         ",
                 "cond = %b  ",            cond,
                 "flags = %b\n",           flags,
                 "Inputs Towards Control_unit_decoder:      ",
                 "op = %b  ",              op,
                 "funct = %b [I = %b, cmd = %b, S = %b]  ", funct, funct[5], funct[4:1], funct[0],
                 "rd = %b\n",              rd,
                 "Own Internal Signals:                     ", //
                 "flag_w = %b  ",          uut.w_flag_w,
                 "pcs = %b  ",             uut.w_pcs,
                 "reg_w = %b  ",           uut.w_reg_w,
                 "mem_w = %b  ",           uut.w_mem_w,
                 "no_write = %b\n",        uut.w_no_write,
                 "Control_unit_decoder Internal Signals:    ",
                 "branch = %b  ",          uut.decoder.w_branch,
                 "alu_op = %b\n",          uut.decoder.w_alu_op,
                 "Conditional_logic Internal Signals:       ",
                 "flag_write = %b  ",      uut.cond_logic.flag_write,
                 "cond_ex = %b  ",         uut.cond_logic.cond_ex,
                 "flags_for_check = %b\n", uut.cond_logic.flags,
                 "Conditional_logic's Outputs:              ",
                 "pc_src = %b  ",          pc_src,
                 "reg_write = %b  ",       reg_write,
                 "mem_write = %b\n",       mem_write, //
                 "Control_unit_decoder's Outputs:           ",
                 "mem_to_reg = %b  ",      mem_to_reg,
                 "alu_src_a = %b  ",       alu_src_a,
                 "alu_src_b = %b  ",       alu_src_b,
                 "imm_src = %b  ",         imm_src,
                 "reg_src = %b  ",         reg_src,
                 "alu_control = %b\n\n",     alu_control);
	end

    always begin
		#50 clk = !clk;
        // control_unit 's
        flag_w = uut.w_flag_w;
        pcs = uut.w_pcs;
        reg_w = uut.w_reg_w;
        mem_w = uut.w_mem_w;
        no_write = uut.w_no_write;
        // contorl_unit_decoder 's
        branch = uut.decoder.w_branch;
        alu_op = uut.decoder.w_alu_op;
        // conditional_logic 's
        flag_write = uut.cond_logic.flag_write;
        cond_ex = uut.cond_logic.cond_ex;
        flags_for_check = uut.cond_logic.flags;
	end

    initial	begin

		#100

        rst = 1;

        #100

        rst = 0;

        #100

        $display("\n\n ** Unconditioned, Data Processing Immediate, SUB cmd, no S, Rd es R13 (sp) ** ");
        instruction = 32'b11100010010011011101000000000100;
        cond  = instruction[31:28]; op = instruction[27:26];
        funct = instruction[25:20]; rd = instruction[15:12];
        $display(" ** No flags ** ");
        flags = 4'b0000;

        #100

        
        
		


        #100;

    end
    


    initial
	#1000 $finish;

endmodule

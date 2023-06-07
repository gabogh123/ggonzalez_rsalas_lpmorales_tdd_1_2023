/*
Test Bench de Main Decoder del Decoder del Control Unit
*/
module main_decoder_tb;

    logic [1:0]          op;
    logic [5:0]       funct;
    logic            branch;
    logic             reg_w;
    logic             mem_w;
    logic        mem_to_reg;
    logic           alu_src;
    logic [1:0]     imm_src;
    logic [1:0]     reg_src;
    logic            alu_op;

    main_decoder uut (.op(op),
                      .funct(funct),
                      .branch(branch),
                      .reg_w(reg_w),
                      .mem_w(mem_w),
                      .mem_to_reg(mem_to_reg),
                      .alu_src(alu_src),
                      .imm_src(imm_src),
                      .reg_src(reg_src),
                      .alu_op(alu_op));

    initial begin
		$display("main_decoder Test Bench:\n");

		funct <= 6'b100001;
		op <= 2'b00;

		$monitor("Op=%b Funct[5]=%b Funct[0]=%b || Branch=%b MemtoReg=%b MemW=%b ALUSrc=%b ImmSrc=%b RegW=%b RegSrc=%b ALUOp=%b\n",
                  op, funct[5], funct[0], branch, mem_to_reg, mem_w, alu_src, imm_src, reg_w, reg_src, alu_op);
	end                  

    initial	begin
	
		#100

        $display("DP Reg");
        op = 2'b00;
		funct[5] = 1'b0;
		funct[0] = 1'b0; /* X */

		#100

        assert (    (branch === 0) & (mem_to_reg === 0) &       (mem_w === 0) & (alu_src === 0) &
               /*(imm_src === 2'b00) &*/      (reg_w === 1) & (reg_src === 2'b00) &  (alu_op === 1) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("DP Reg");
        op = 2'b00;
		funct[5] = 1'b0;
		funct[0] = 1'b1; /* X */

		#100

        assert (        (branch === 0) & (mem_to_reg === 0) &       (mem_w === 0) & (alu_src === 0) &
               /*(imm_src === 2'b00) &*/      (reg_w === 1) & (reg_src === 2'b00) &  (alu_op === 1) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("DP Imm");
        op = 2'b00;
		funct[5] = 1'b1;
		funct[0] = 1'b0; /* X */

		#100

        assert (    (branch === 0) & (mem_to_reg === 0) &          (mem_w === 0) & (alu_src === 1) &
               (imm_src === 2'b00) &      (reg_w === 1) & (/**/reg_src[0] === 0) &  (alu_op === 1) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("DP Imm");
        op = 2'b00;
		funct[5] = 1'b1;
		funct[0] = 1'b1; /* X */

		#100

        assert (    (branch === 0) & (mem_to_reg === 0) &          (mem_w === 0) & (alu_src === 1) &
               (imm_src === 2'b00) &      (reg_w === 1) & (/**/reg_src[0] === 0) &  (alu_op === 1) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("STR");
        op = 2'b01;
		funct[5] = 1'b0; /* X */
		funct[0] = 1'b0;

		#100

        assert (    (branch === 0) & /*(mem_to_reg === 0)*/ &       (mem_w === 1) & (alu_src === 1) &
               (imm_src === 2'b01) &          (reg_w === 0) & (reg_src === 2'b10) &  (alu_op === 0) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("STR");
        op = 2'b01;
		funct[5] = 1'b1; /* X */
		funct[0] = 1'b0;

		#100

        assert (    (branch === 0) & /*(mem_to_reg === 0)*/ &       (mem_w === 1) & (alu_src === 1) &
               (imm_src === 2'b01) &          (reg_w === 0) & (reg_src === 2'b10) &  (alu_op === 0) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("LDR");
        op = 2'b01;
		funct[5] = 1'b0; /* X */
		funct[0] = 1'b1;

		#100

        assert (    (branch === 0) & (mem_to_reg === 1) &          (mem_w === 0) & (alu_src === 1) &
               (imm_src === 2'b01) &      (reg_w === 1) & (/**/reg_src[0] === 0) &  (alu_op === 0) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("LDR");
        op = 2'b01;
		funct[5] = 1'b1; /* X */
		funct[0] = 1'b1;

		#100

        assert (    (branch === 0) & (mem_to_reg === 1) &          (mem_w === 0) & (alu_src === 1) &
               (imm_src === 2'b01) &      (reg_w === 1) & (/**/reg_src[0] === 0) &  (alu_op === 0) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("B");
        op = 2'b10;
		funct[5] = 1'b0; /* X */
		funct[0] = 1'b0; /* X */

		#100

        assert (    (branch === 1) & (mem_to_reg === 0) &          (mem_w === 0) & (alu_src === 1) &
               (imm_src === 2'b10) &      (reg_w === 0) & (/**/reg_src[0] === 1) &  (alu_op === 0) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("B");
        op = 2'b10;
		funct[5] = 1'b0; /* X */
		funct[0] = 1'b1; /* X */

		#100

        assert (    (branch === 1) & (mem_to_reg === 0) &          (mem_w === 0) & (alu_src === 1) &
               (imm_src === 2'b10) &      (reg_w === 0) & (/**/reg_src[0] === 1) &  (alu_op === 0) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("B");
        op = 2'b10;
		funct[5] = 1'b1; /* X */
		funct[0] = 1'b0; /* X */

		#100

        assert (    (branch === 1) & (mem_to_reg === 0) &          (mem_w === 0) & (alu_src === 1) &
               (imm_src === 2'b10) &      (reg_w === 0) & (/**/reg_src[0] === 1) &  (alu_op === 0) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100

        $display("B");
        op = 2'b10;
		funct[5] = 1'b1; /* X */
		funct[0] = 1'b1; /* X */

		#100

        assert (    (branch === 1) & (mem_to_reg === 0) &          (mem_w === 0) & (alu_src === 1) &
               (imm_src === 2'b10) &      (reg_w === 0) & (/**/reg_src[0] === 1) &  (alu_op === 0) )
		else $error("Failed @ Op=%b Funct[5]=%b Funct[0]=%b",
                     op, funct[5], funct[0]);

        #100;

        // Done

    end

endmodule

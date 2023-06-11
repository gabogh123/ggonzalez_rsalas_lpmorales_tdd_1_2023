/*

*/
module cmp_bgt_ldr_tb;

    // Inputs
    logic  				 clk;
	logic  				 rst;
	logic [31:0] instruction;
	logic [31:0]   read_data;

	// Outputs
	logic [31:0] 		  pc;
	logic		   mem_write;
	logic [31:0]  alu_result;
	logic [31:0]  write_data;

	// Internal processor
	logic 					 pc_src;
	logic  [1:0]			reg_src;
	logic				  reg_write;
	logic  [1:0]			imm_src;
	logic     			  alu_src_a;
	logic     			  alu_src_b;
	logic  [1:0] 		alu_control;
	logic				 mem_to_reg;
	logic [31:0]  	next_pc_address;
	logic [31:0]     	  pc_plus_4;
	logic [31:0]     	  pc_plus_8;
	logic  [3:0]			     Rn;
	logic  [3:0]			     Rm;
	logic  [3:0]			     Rd;
	logic [23:0]			  Imm24;
	logic  [3:0]			   r_a1;
	logic  [3:0]			   r_a2;
	logic [31:0]			   rd_1;
	logic [31:0]    		   rd_2;
	logic [31:0]			ext_imm;
	logic [31:0]			  src_a;
	logic [31:0]			  src_b;
	logic  [3:0]		  alu_flags;
	logic [31:0]			 result;

	// Control Unit inputs
	logic [3:0]        	cond; // instruction[31:28]
    logic [3:0]        flags; // from alu 4'b
    logic [1:0]           op; // instruction[27:26]
    logic [5:0]        funct; // instruction[25:20]
    logic [3:0]           rd; // instruction[15:12]


    processor uut (.clk(clk),
				   .rst(rst),
				   .instruction(instruction),
				   .read_data(read_data),
				   .pc(pc),
				   .mem_write(mem_write),
				   .alu_result(alu_result),
				   .write_data(write_data));

    initial begin
		$display("processor Test Bench:\n");

		clk = 0;
		rst = 0;

        instruction = 32'b0;
		read_data <= 32'b0;

		$monitor("\n\n\nProcessor's Inputs:\n",
				 "instruction = %b\n",    	instruction,
                 "read_data = %b\n",      	read_data,
                 "pc = %b\n\n",           	pc,

				 "Control Unit's Inputs:\n",
				 "cond = %b\n", 		uut.cont_unit.cond,
				 "op = %b\n", 			uut.cont_unit.op,
				 "funct = %b\n", 		uut.cont_unit.funct,
				 "rd = %b\n", 			uut.cont_unit.rd,
				 "flags = %b\n\n", 		uut.cont_unit.flags,

				 "Internal Control Signals:\n",
				 "pc_src = %b\n", 		  	uut.pc_src,
				 "reg_src[0] = %b\n", 	  	uut.reg_src[0],
				 "reg_src[1] = %b\n", 	  	uut.reg_src[1],
				 "reg_write = %b\n", 	  	uut.reg_write,
				 "imm_src[1] = %b\n", 	    uut.imm_src[1],
				 "imm_src[0] = %b\n", 	    uut.imm_src[0],
				 "alu_src_a = %b\n", 		uut.alu_src_a,
				 "alu_src_b = %b\n", 		uut.alu_src_b,
				 "alu_control[1] = %b\n",   uut.alu_control[1],
				 "alu_control[0] = %b\n\n", uut.alu_control[0],
				 "mem_to_reg = %b  ",       uut.mem_to_reg,
				 
				 "Processor's Internal Results:\n",
				 "next_pc_address = %b\n",  uut.next_pc_address,
				 "pc_plus_4 = %b\n", 		uut.pc_plus_4,
				 "pc_plus_8 = %b\n", 		uut.pc_plus_8,
				 "Rn = %b\n", 				uut.instruction[19:16],
				 "Rm = %b\n", 				uut.instruction[3:0],
				 "Rd = %b\n", 				uut.instruction[15:12],
				 "Imm24 = %b\n", 			uut.instruction[23:0],
				 "Imm12 = %b\n", 			uut.instruction[11:0],
				 "Imm8 = %b\n", 			uut.instruction[7:0],
				 "r_a1 = %b\n", 			uut.r_a1,
				 "r_a2 = %b\n", 			uut.r_a2,
				 "rd_1 = %b\n", 			uut.rd1_data,
				 "rd_2(write_data) = %b\n", uut.write_data,
				 "ext_imm = %b\n", 			uut.ext_imm,
				 "src_a = %b\n", 			uut.src_a,
				 "src_b = %b\n", 			uut.src_b,
				 "alu_result = %b\n", 		uut.alu_result,
				 "alu_flags = %b\n", 		uut.alu_flags,
				 "result = %b\n\n", 		uut.result,
				 
				 "Processor's Outputs:\n",
                 "mem_write = %b\n",        mem_write,
                 "alu_result = %b\n",       alu_result,
                 "write_data = %b\n\n\n",   write_data );
	end


    always begin
		#50 clk = !clk;

		// Internal Processor
		pc_src = 			uut.pc_src;
		reg_src[0] = 		uut.reg_src[0];
		reg_src[1] = 		uut.reg_src[1];
		reg_write = 		uut.reg_write;
		imm_src[1] =	    uut.imm_src[1];
		imm_src[0] 	=    	uut.imm_src[0];
		alu_src_a =			uut.alu_src_a;
		alu_src_b =			uut.alu_src_b;
		alu_control[1] = 	uut.alu_control[1];
		alu_control[0] =  	uut.alu_control[0];
		mem_to_reg = 		uut.mem_to_reg;
		next_pc_address = 	uut.next_pc_address;
		pc_plus_4 =			uut.pc_plus_4;
		pc_plus_8 =			uut.pc_plus_8;
		Rn =				uut.instruction[19:16];
		Rm =				uut.instruction[3:0];
		Rd =				uut.instruction[15:12];
		Imm24 =				uut.instruction[23:0];
		r_a1 =				uut.r_a1;
		r_a2 = 				uut.r_a2;
		rd_1 = 				uut.rd1_data;
		rd_2 = 				uut.write_data;
		ext_imm =			uut.ext_imm;
		src_a =				uut.src_a;
		src_b =				uut.src_b;
		alu_flags =			uut.alu_flags;
		result = 			uut.result;

		// Control Unit Inputs
		cond = 				uut.cont_unit.cond;
		op = 				uut.cont_unit.op;
		funct = 			uut.cont_unit.funct;
		rd = 				uut.cont_unit.rd;
		flags = 			uut.cont_unit.flags;
	end


    initial	begin

		#100

        rst = 1;

        #100

        rst = 0;

        #50

		read_data <= 32'b11110000111100001111000011110000;

		#50

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "1. Instruction: MOV R3, #14 (0xe3a0300e)");
		instruction = 32'b11100011101000000011000000001110;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        assert (        (pc_src === 0) &
                    (reg_src[0] === 0) &
                  //(reg_src[1] === 0) &
                     (reg_write === 1) &
                    (imm_src[1] === 1) &
                    (imm_src[0] === 1) &
                     (alu_src_a === 1) &
                     (alu_src_b === 1) &
                (alu_control[1] === 0) &
                (alu_control[0] === 0) &
                     (mem_write === 0) &
                    (mem_to_reg === 0) )
		else $error("Failed @ instruction=%b", instruction);

        //#100

         $display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "2. Instruction: MOV R4, R3 (0xe1a04003)");
		instruction = 32'b11100001101000000100000000000011;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        assert (        (pc_src === 0) &
                    (reg_src[0] === 0) &
                    (reg_src[1] === 0) &
                     (reg_write === 1) &
                  //(imm_src[1] === 0) &
                  //(imm_src[0] === 0) &
                     (alu_src_a === 1) &
                     (alu_src_b === 0) &
                (alu_control[1] === 0) &
                (alu_control[0] === 0) &
                     (mem_write === 0) &
                    (mem_to_reg === 0) )
		else $error("Failed @ instruction=%b", instruction);

        //#100

        $display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "3. Instruction: SUB R5, R3, #16 (e2435006)");
		instruction = 32'b11100010010000110101000000000110;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        assert (        (pc_src === 0) &
                    (reg_src[0] === 0) &
                  //(reg_src[1] === 0) &
                     (reg_write === 1) &
                    (imm_src[1] === 0) &
                    (imm_src[0] === 0) &
                     (alu_src_a === 0) &
                     (alu_src_b === 1) &
                (alu_control[1] === 0) &
                (alu_control[0] === 1) &
                     (mem_write === 0) &
                    (mem_to_reg === 0) )
		else $error("Failed @ instruction=%b", instruction);

        //#100

        $display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "4. Instruction: CMP R5, #3 (0xe3550003)");
		instruction = 32'b11100011010101010000000000000011;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        assert (        (pc_src === 0) &
                    (reg_src[0] === 0) &
                  //(reg_src[1] === 0) &
                     (reg_write === 0) &
                    (imm_src[1] === 0) &
                    (imm_src[0] === 0) &
                     (alu_src_a === 0) &
                     (alu_src_b === 1) &
                (alu_control[1] === 0) &
                (alu_control[0] === 1) &
                     (mem_write === 0) &
                    (mem_to_reg === 0) )
		else $error("Failed @ instruction=%b", instruction);

        //#100

        $display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "5. Instruction: BGT 0xfc1 (0xca0003ea)");
		instruction = 32'b11001010000000000000001111101010;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        assert (        (pc_src === 1) &
                    (reg_src[0] === 1) &
                  //(reg_src[1] === 0) &
                     (reg_write === 0) &
                    (imm_src[1] === 1) &
                    (imm_src[0] === 0) &
                     (alu_src_a === 0) &
                     (alu_src_b === 1) &
                (alu_control[1] === 0) &
                (alu_control[0] === 0) &
                     (mem_write === 0) &
                    (mem_to_reg === 0) )
		else $error("Failed @ instruction=%b", instruction);

        //#100

        $display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "6. Instruction: LDR R0, [R5] (0xe5950000)");
		instruction = 32'b11100101100101010000000000000000;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        assert (        (pc_src === 0) &
                    (reg_src[0] === 0) & //base
                  //(reg_src[1] === 0) &
                     (reg_write === 1) &
                    (imm_src[1] === 0) &
                    (imm_src[0] === 1) &
                     (alu_src_a === 0) &
                     (alu_src_b === 1) &
                (alu_control[1] === 0) &
                (alu_control[0] === 0) &
                     (mem_write === 0) &
                    (mem_to_reg === 1) )
		else $error("Failed @ instruction=%b", instruction);

        //#100

       

        $display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "7. Instruction: LDR R1, [R4, #722] (0xe59412d2)");
		instruction = 32'b11100101100101000001001011010010;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        assert (        (pc_src === 0) &
                    (reg_src[0] === 0) & //base
                  //(reg_src[1] === 0) &
                     (reg_write === 1) &
                    (imm_src[1] === 0) &
                    (imm_src[0] === 1) &
                     (alu_src_a === 0) &
                     (alu_src_b === 1) &
                (alu_control[1] === 0) &
                (alu_control[0] === 0) &
                     (mem_write === 0) &
                    (mem_to_reg === 1) )
		else $error("Failed @ instruction=%b", instruction);

        //#100

		

       


        #100;

		//

    end

    initial
	#1500 $finish;

endmodule

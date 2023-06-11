/*
Test bench del processor
*/
module processor_tb;

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
				 "1. Instruction: MOV R0, #10 (0xe3a0000a)");
		instruction = 32'b11100011101000000000000000001010;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "2. Instruction: MOV R1, R0 (0xe1a01000)");
		instruction = 32'b11100001101000000001000000000000;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "3. Instruction: ADD R2, R0, R1 (0xe0802001)");
		instruction = 32'b11100000100000000010000000000001;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "4. Instruction: ADD R3, R2, #15 (0xe282300f)");
		instruction = 32'b11100010100000100011000000001111;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "5. Instruction: SUB R4, R0, R1 (0xe0404001)");
		instruction = 32'b11100000010000000100000000000001;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "6. Instruction: SUB R5, R3, #30 (0xe243501e)");
		instruction = 32'b11100010010000110101000000011110;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "7. Instruction: CMP R3, R5 (0xe1530005)");
		instruction = 32'b11100001010100110000000000000101;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "8. Instruction: BGT 0x94 (0xca00001c)");
		instruction = 32'b11001010000000000000000000011100;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "9. Instruction: CMP R1, #10 (0xe351000a)");
		instruction = 32'b11100011010100010000000000001010;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "10. Instruction: BEQ 0xec (0x0a000030)");
		instruction = 32'b00001010000000000000000000110000;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "11. Instruction: CMP R4, R2 (0xe1540002)");
		instruction = 32'b11100001010101000000000000000010;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "11. Instruction: BLT 0x2d0 (0xba0000a7)");
		instruction = 32'b10111010000000000000000010100111;
		#100
		$display("\n| R00 | : | %b |\n", 	 uut.reg_file.R0.Q, 
				   "| R01 | : | %b |\n", 	 uut.reg_file.R1.Q,
				   "| R02 | : | %b |\n", 	 uut.reg_file.R2.Q,
				   "| R03 | : | %b |\n", 	 uut.reg_file.R3.Q,
				   "| R04 | : | %b |\n", 	 uut.reg_file.R4.Q,
				   "| R05 | : | %b |\n\n\n", uut.reg_file.R5.Q);


        #100;

		// Done

    end

    initial
	#2000 $finish;

endmodule

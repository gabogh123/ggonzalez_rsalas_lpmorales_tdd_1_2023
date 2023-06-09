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

        //$display("\n\n ** Unconditioned, Data Processing Immediate, SUB cmd, no S, Rd es R13 (sp) ** ");
        $display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "Instruction: mov R9, #10");
		instruction = 32'b11100011101000001001000000001010;
		$display("\n| R05 | : | %b |", uut.reg_file.R5.Q, 
				   "| R09 | : | %b |", uut.reg_file.R9.Q,
				   "| R10 | : | %b |", uut.reg_file.R10.Q,
				   "| R11 | : | %b |\n\n\n", uut.reg_file.R11.Q);

        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "Instruction: mov R11, #5");
		instruction = 32'b11100011101000001011000000000101;
		$display("\n| R05 | : | %b |", uut.reg_file.R5.Q, 
				   "| R09 | : | %b |", uut.reg_file.R9.Q,
				   "| R10 | : | %b |", uut.reg_file.R10.Q,
				   "| R11 | : | %b |\n\n\n", uut.reg_file.R11.Q);


        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "Instruction: add R10, R11, R9");
		instruction = 32'b11100000100010111010000000001001;
		$display("\n| R05 | : | %b |", uut.reg_file.R5.Q, 
				   "| R09 | : | %b |", uut.reg_file.R9.Q,
				   "| R10 | : | %b |", uut.reg_file.R10.Q,
				   "| R11 | : | %b |\n\n\n", uut.reg_file.R11.Q);


        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "Instruction: sub R5, R11, R10");
		instruction = 32'b11100000010010110101000000001010;
		$display("\n| R05 | : | %b |", uut.reg_file.R5.Q, 
				   "| R09 | : | %b |", uut.reg_file.R9.Q,
				   "| R10 | : | %b |", uut.reg_file.R10.Q,
				   "| R11 | : | %b |\n\n\n", uut.reg_file.R11.Q);


        #100

		$display("\n!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\n",
				 "Instruction: add R5, R5, #0");
		instruction = 32'b11100010100001010101000000000000;
		$display("\n| R05 | : | %b |\n", uut.reg_file.R5.Q, 
				   "| R09 | : | %b |\n", uut.reg_file.R9.Q,
				   "| R10 | : | %b |\n", uut.reg_file.R10.Q,
				   "| R11 | : | %b |\n\n\n", uut.reg_file.R11.Q);


        #100





        #100;

    end

    initial
	#1500 $finish;

endmodule

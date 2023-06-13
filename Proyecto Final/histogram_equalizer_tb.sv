/*
Test bench para el top module Histogram Equalizer
*/
module histogram_equalizer_tb;

    timeunit 1ps;
    timeprecision 1ps;

    logic clk;
    logic rst;
    logic btn;
    logic Y;

    logic enable;
    logic eclk;

    logic [31:0] pc;
    logic [31:0] instruction;

    logic mem_write;
    logic [31:0] alu_result;
    logic [31:0] write_data;
    logic [31:0] read_data;

    logic [3:0] Rn;
    logic [3:0] Rm;
    logic [3:0] Rd;
    
    logic [1:0] n;


    histogram_equalizer uut (.clk(clk),
                             .rst(rst),
                             .btn(btn),
                             .Y(Y));

    initial begin
		$display("histogram_equalizer Test Bench:\n");

		clk  = 0;
        rst  = 0;
        btn  = 1;
        n = 0;
    end
    

    always begin
		#100 clk = !clk;

        enable = uut.enable;
        eclk = uut.eclk;
        pc = uut.arm.pc;
        instruction = uut.arm.instruction;
        alu_result = uut.arm.alu_result;
        write_data = uut.arm.write_data;
        mem_write = uut.arm.mem_write;
        read_data = uut.arm.read_data;
        Rn = uut.arm.instruction[19:16];
        Rm = uut.arm.instruction[3:0];
		Rd = uut.arm.instruction[15:12];

        n = n + 1;

        if (n == 2) begin

            n = 0;

            $display("enable = %b\n",               uut.enable,
                 "next_pc_address   = %b (%h)\n",   uut.arm.next_pc_address, uut.arm.next_pc_address,
                 "pc                = %b (%h)\n",   uut.arm.pc, uut.arm.pc,
                 "instruction       = %b (%h)\n",   uut.arm.instruction, uut.arm.instruction,
                 "alu_result        = %b (%h)\n",   uut.arm.alu_result, uut.arm.alu_result,
                 "write_data        = %b (%h)\n",   uut.arm.write_data, uut.arm.write_data,
                 "mem_write         = %b\n"     ,   uut.arm.mem_write,
                 "read_data         = %b (%h)\n\n", uut.arm.read_data, uut.arm.read_data,
                    
                 "Memory Signals's:\n",
                 "instruction_rd = %b (%h)\n",      uut.ram_rom.instruction_rd, uut.ram_rom.instruction_rd,
                 "data_rd        = %b (%h)\n",      uut.ram_rom.data_rd, uut.ram_rom.data_rd,
                 "vga_rd         = %b (%h)\n\n",    uut.ram_rom.vga_rd, uut.ram_rom.vga_rd,
                    
                    /*
                 "Instruction Memory's:\n",
                 "A  = %b (%h)\n",                  uut.rom.A, uut.rom.A,
                 "RD = %b (%h)\n",                  uut.rom.RD, uut.rom.RD,
                 "ROM3: address = %b (%h)\n",       uut.rom.rom_3.address, uut.rom.rom_3.address,
                 "      q       = %b (%h)\n",       uut.rom.rom_3.q_8bits, uut.rom.rom_3.q_8bits,
                 "ROM2: address = %b (%h)\n",       uut.rom.rom_2.address, uut.rom.rom_2.address,
                 "      q       = %b (%h)\n",       uut.rom.rom_2.q_8bits, uut.rom.rom_2.q_8bits,
                 "ROM1: address = %b (%h)\n",       uut.rom.rom_1.address, uut.rom.rom_1.address,
                 "      q       = %b (%h)\n",       uut.rom.rom_1.q_8bits, uut.rom.rom_1.q_8bits,
                 "ROM0: address = %b (%h)\n",       uut.rom.rom_0.address, uut.rom.rom_0.address,
                 "      q       = %b (%h)\n",       uut.rom.rom_0.q_8bits, uut.rom.rom_0.q_8bits,

                 "Data Memory's:\n",
                 "A  = %b (%h)\n",                  uut.ram.A, uut.ram.A,
                 "WD = %b (%h)\n",                  uut.ram.WD, uut.ram.WD,
                 "WE = %b\n",                       uut.ram.WE,
                 "RD = %b (%h)\n",                  uut.ram.RD, uut.ram.RD,
                 "RAM3: address = %b (%h)\n",       uut.ram.ram_3.address, uut.ram.ram_3.address,
                 "      q       = %b (%h)\n",       uut.ram.ram_3.q_8bits, uut.ram.ram_3.q_8bits,
                 "RAM2: address = %b (%h)\n",       uut.ram.ram_2.address, uut.ram.ram_2.address,
                 "      q       = %b (%h)\n",       uut.ram.ram_2.q_8bits, uut.ram.ram_2.q_8bits,
                 "RAM1: address = %b (%h)\n",       uut.ram.ram_1.address, uut.ram.ram_1.address,
                 "      q       = %b (%h)\n",       uut.ram.ram_1.q_8bits, uut.ram.ram_1.q_8bits,
                 "RAM0: address = %b (%h)\n",       uut.ram.ram_0.address, uut.ram.ram_0.address,
                 "      q       = %b (%h)\n",       uut.ram.ram_0.q_8bits, uut.ram.ram_0.q_8bits,

                            */
                 "REGISTERS:\n",

                   "| R00 | : | %b (%h) |\n", 	    uut.arm.reg_file.R0.Q,  uut.arm.reg_file.R0.Q, 
				   "| R01 | : | %b (%h) |\n", 	    uut.arm.reg_file.R1.Q,  uut.arm.reg_file.R1.Q,
				   "| R02 | : | %b (%h) |\n", 	    uut.arm.reg_file.R2.Q,  uut.arm.reg_file.R2.Q,
				   "| R03 | : | %b (%h) |\n", 	    uut.arm.reg_file.R3.Q,  uut.arm.reg_file.R3.Q,
				   "| R04 | : | %b (%h) |\n", 	    uut.arm.reg_file.R4.Q,  uut.arm.reg_file.R4.Q,
				   "| R05 | : | %b (%h) |\n",       uut.arm.reg_file.R5.Q,  uut.arm.reg_file.R5.Q,
                   "| R06 | : | %b (%h) |\n", 	    uut.arm.reg_file.R6.Q,  uut.arm.reg_file.R6.Q,
				   "| R07 | : | %b (%h) |\n", 	    uut.arm.reg_file.R7.Q,  uut.arm.reg_file.R7.Q,
				   "| R08 | : | %b (%h) |\n", 	    uut.arm.reg_file.R8.Q,  uut.arm.reg_file.R8.Q,
				   "| R09 | : | %b (%h) |\n", 	    uut.arm.reg_file.R9.Q,  uut.arm.reg_file.R9.Q, 
				   "| R10 | : | %b (%h) |\n",       uut.arm.reg_file.R10.Q, uut.arm.reg_file.R10.Q,
                   "| R11 | : | %b (%h) |\n", 	    uut.arm.reg_file.R11.Q, uut.arm.reg_file.R11.Q,
				   "| R12 | : | %b (%h) |\n", 	    uut.arm.reg_file.R12.Q, uut.arm.reg_file.R12.Q,
				   "|  sp | : | %b (%h) |\n", 	    uut.arm.reg_file.R13.Q, uut.arm.reg_file.R13.Q,
				   "|  lr | : | %b (%h) |\n", 	    uut.arm.reg_file.R14.Q, uut.arm.reg_file.R14.Q,
				   "|  pc | : | %b (%h) |\n\n",     uut.arm.reg_file.R15.Q, uut.arm.reg_file.R15.Q,
                 
                 "Processor's:\n",
                 "Control Unit's Inputs:\n",
				 "cond = %b\n", 		            uut.arm.cont_unit.cond,
				 "op = %b\n", 			            uut.arm.cont_unit.op,
				 "funct = %b\n", 		            uut.arm.cont_unit.funct,
				 "rd = %b\n", 			            uut.arm.cont_unit.rd,
				 "flags = %b\n\n", 		            uut.arm.cont_unit.flags,
                
				 "Internal Control Signals:\n",
				 "pc_src = %b\n", 		  	        uut.arm.pc_src,
				 "reg_src[0] = %b\n", 	  	        uut.arm.reg_src[0],
				 "reg_src[1] = %b\n", 	  	        uut.arm.reg_src[1],
				 "reg_write = %b\n", 	  	        uut.arm.reg_write,
				 "imm_src[1] = %b\n", 	            uut.arm.imm_src[1],
				 "imm_src[0] = %b\n", 	            uut.arm.imm_src[0],
				 "alu_src_a = %b\n", 		        uut.arm.alu_src_a,
				 "alu_src_b = %b\n", 		        uut.arm.alu_src_b,
				 "alu_control[1] = %b\n",           uut.arm.alu_control[1],
				 "alu_control[0] = %b\n",           uut.arm.alu_control[0],
				 "mem_to_reg = %b\n\n",             uut.arm.mem_to_reg,
				 
				 "Processor's Internal Results:\n",
				 "pc_plus_4 = %b (%h)\n", 	        uut.arm.pc_plus_4, uut.arm.pc_plus_4,
				 "pc_plus_8 = %b (%h)\n", 	        uut.arm.pc_plus_8, uut.arm.pc_plus_8,
				 "Rn = %b\n", 				        uut.arm.instruction[19:16],
				 "Rm = %b\n", 				        uut.arm.instruction[3:0],
				 "Rd = %b\n", 				        uut.arm.instruction[15:12],
				 "Imm24 = %b (%h)\n", 			    uut.arm.instruction[23:0], uut.arm.instruction[23:0],
				 "Imm12 = %b (%h)\n", 			    uut.arm.instruction[11:0], uut.arm.instruction[11:0],
				 "Imm8 = %b (%h)\n", 			    uut.arm.instruction[7:0], uut.arm.instruction[7:0],
				 "r_a1 = %b\n", 			        uut.arm.r_a1,
				 "r_a2 = %b\n", 			        uut.arm.r_a2,
				 "rd_1 = %b (%h)\n", 			    uut.arm.rd1_data, uut.arm.rd1_data,
				 "rd_2(write_data) = %b (%h)\n",    uut.arm.write_data, uut.arm.write_data,
				 "ext_imm = %b\n", 			        uut.arm.ext_imm,
				 "src_a = %b (%h)\n", 			    uut.arm.src_a, uut.arm.src_a,
				 "src_b = %b (%h)\n", 			    uut.arm.src_b, uut.arm.src_b,
				 "alu_result = %b (%h)\n", 		    uut.arm.alu_result, uut.arm.alu_result,
				 "alu_flags = %b\n", 		        uut.arm.alu_flags,
				 "result = %b (%h)\n\n", 	        uut.arm.result, uut.arm.result );
        
        end

        
    end

    initial	begin

		#50

        rst=1;
        btn = 0;

        #100

        rst=0;
        btn = 1;

        #100;

		//

    end

    initial
	#3500 $finish;   


endmodule

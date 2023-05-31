/*

Representa el procesador ARM

*/
module processor(clk, rst, en, instruction, read_data, pc, alu_result, write_data, vga_en);

	input  logic  				clk;
	input  logic  				rst;
	input  logic  				 en; // ?
	
	input  logic [31:0] instruction;
	input  logic [31:0]   read_data;
	
	output logic [31:0] 		 pc;
	output logic [31:0]  alu_result;
	output logic [31:0]  write_data;
	
	output logic  		     vga_en;


	wire [31:0]  	next_pc_address;

	wire [31:0]     	  pc_plus_4;
	wire [31:0]     	  pc_plus_8;

	wire  [3:0]				   r_a1;
	wire  [3:0]				   r_a2;

	wire [31:0]				  src_a;
	wire [31:0]				  src_b;

	wire [31:0]				ext_imm;

	wire [31:0]				 result;

	
	/* PC_MUX */ /*
	mux_2NtoN # (.N(32)) pc_mux (.I0(pc_plus_4),
								 .I1(result),
								 .S(pc_src),
								 .O(next_pc_address)); */
	
	/* PC Register -> (.N(32)) */
	register # (.N(32)) program_counter (.clk(clk),
										 .rst(rst),
										 .D(next_pc_address),
										 .Q(pc));

	/* PCPlus4_Adder -> 2 x (.N(32)) */
	adder # (.N(32)) pc_plus_4_adder (.A(pc),
									  .B(32'b100),
									  .Y(pc_plus_4));
	

	// Control_Unit

	
	/* PCPlus8_Adder -> 2 x (.N(32)) */
	adder # (.N(32)) pc_plus_8_adder (.A(pc_plus_4),
									  .B(32'b100),
									  .Y(pc_plus_8));
	
	/* RN_MUX */ /*
	mux_2NtoN # (.N(4)) rn_mux (.I0(instruction[19:16]),
								.I1(4'b1111),
								.S(reg_src),
								.O(r_a1)); */
	
	/* RM_RD_MUX */ /*
	mux_2NtoN # (.N(4)) rm_rd_mux (.I0(instruction[3:0]),
								   .I1(instruction[15:12]),
								   .S(reg_src),
								   .O(r_a2)); */


	// Register File

	
	/* Extend -> (.N(24)) */ /*
	extend # (.N(24)) extender (.A(instruction[23:0]),
								.S(imm_src),
						   		.Y(ext_imm)); */
	
	/* ALU_MUX */ /*
	mux_2NtoN # (.N(32)) alu_mux (.I0(write_data),
								  .I1(ext_imm),
								  .S(alu_src),
								  .O(src_b)); */
	

	// ALU -> 2 x (.N(32))

	
	/* Data_MUX */ /*
	mux_2NtoN # (.N(32)) data_mux (.I0(alu_result),
								   .I1(read_data),
								   .S(mem_to_reg),
								   .O(result)); */

endmodule

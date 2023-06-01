/*

Procesador ARM
Hecho a base de la Figura 7.13 Procesador uniciclo completo
del libro Digital Design and Computer Architecture ARM Editon
de Sarah L. Harries & David Money Harries. 

*/
module processor(
	clk, rst, instruction, read_data,
	pc, mem_write, alu_result, write_data
	);

	input  logic  				clk;
	input  logic  				rst;
	
	input  logic [31:0] instruction;
	input  logic [31:0]   read_data;
	
	output logic [31:0] 		 pc;
	output logic		  mem_write;
	output logic [31:0]  alu_result;
	output logic [31:0]  write_data;


	wire [31:0]  	next_pc_address;

	wire [31:0]     	  pc_plus_4;
	wire [31:0]     	  pc_plus_8;

	wire 					 pc_src;
	wire 					reg_src;
	wire				  reg_write;
	wire 					imm_src;
	wire 					alu_src;
	wire  [3:0] 		alu_control;
	wire 				 mem_to_reg;

	wire  [3:0]				   r_a1;
	wire  [3:0]				   r_a2;

	wire [31:0]				  src_a;
	wire [31:0]				  src_b;

	wire [31:0]				ext_imm;

	wire  [4:0]			  alu_flags;

	wire [31:0]				 result;

	
	/* PC_MUX */ /* tb done */
	mux_2NtoN # (.N(32)) pc_mux (.I0(pc_plus_4),
								 .I1(result),
								 .S(pc_src),
								 .O(next_pc_address));
	
	/* PC Register */
	register # (.N(32)) program_counter (.clk(clk),
										 .rst(rst),
										 .D(next_pc_address),
										 .Q(pc));

	/* PCPlus4_Adder */
	adder # (.N(32)) pc_plus_4_adder (.A(pc),
									  .B(32'b100),
									  .Y(pc_plus_4));
	
	/* Control_Unit */
	control_unit cont_unit (.clk(clk),
							.rst(rst),
							.cond(instruction[31:28]),
							.op(instruction[27:26]),
							.funct(instruction[25:20]),
							.rd(instruction[15:12]),
							.flags(alu_flags),
							.pc_src(pc_src),
							.mem_to_reg(mem_to_reg),
							.mem_write(mem_write),
							.alu_control(alu_control),
							.alu_src(alu_src),
							.imm_src(imm_src),
							.reg_write(reg_write),
							.reg_src(reg_src));

	
	/* PCPlus8_Adder */ /* tb done */
	adder # (.N(32)) pc_plus_8_adder (.A(pc_plus_4),
									  .B(32'b100),
									  .Y(pc_plus_8));
	
	/* RN_MUX */ /* tb done */
	mux_2NtoN # (.N(4)) rn_mux (.I0(instruction[19:16]),
								.I1(4'b1111),
								.S(reg_src),
								.O(r_a1));
	
	/* RM_RD_MUX */ /* tb done */
	mux_2NtoN # (.N(4)) rm_rd_mux (.I0(instruction[3:0]),
								   .I1(instruction[15:12]),
								   .S(reg_src),
								   .O(r_a2));

	/* Register File */
	register_file reg_file (.clk(clk),
							.rst(rst),
							.a_1(r_a1),
							.a_2(r_a2),
							.a_3(instruction[15:12]),
							.wd_3(result),
							.r_15(pc_plus_8),
							.we_3(reg_write),
							.rd_1(src_a),
							.rd_2(write_data));
	
	/* Extend */
	extend # (.N(24)) extender (.A(instruction[23:0]),
								.S(imm_src),
						   		.Y(ext_imm));
	
	/* ALU_MUX */
	mux_2NtoN # (.N(32)) alu_mux (.I0(write_data),
								  .I1(ext_imm),
								  .S(alu_src),
								  .O(src_b));
	
	/* ALU */
	alu the_alu (.A(src_a),
				 .B(src_b),
				 .func(alu_control),
				 .Y(alu_result),
				 .flags(alu_flags));
	
	/* Data_MUX */ /* tb done */
	mux_2NtoN # (.N(32)) data_mux (.I0(alu_result),
								   .I1(read_data),
								   .S(mem_to_reg),
								   .O(result));

endmodule

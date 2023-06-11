/*
Test Bench de ALU Decoder del Decoder del Control Unit
*/
module alu_decoder_tb;

    logic [4:0]       funct;
    logic            alu_op;
    logic          no_write;
    logic [1:0] alu_control;
    logic [1:0]      flag_w;
    logic         alu_src_a;

    alu_decoder uut (.funct(funct),
                     .alu_op(alu_op),
                     .no_write(no_write),
                     .alu_control(alu_control),
                     .flag_w(flag_w),
                     .alu_src_a(alu_src_a));

    initial begin
		$display("alu_decoder Test Bench:\n");

		funct <= 5'b11111;
		alu_op <= 0;

		$monitor("ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b || ALUControl[1:0]=%b FlagW[1:0]=%b NoWrite=%b ALUSrcA=%b\n",
                  alu_op, funct[4:1], funct[0], alu_control, flag_w, no_write, alu_src_a);
	end

    initial	begin
	
		#100

        $display("Not DP");
        alu_op = 0;
		funct[4:1] = 4'b0000;
		funct[0] = 1'b0;

		#100

        assert((alu_control === 2'b00) & (flag_w === 2'b00) & (no_write === 0))
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("Not DP");
        alu_op = 0;
		funct[4:1] = 4'b1010;
		funct[0] = 1'b1;

		#100

        assert((alu_control === 2'b00) & (flag_w === 2'b00) & (no_write === 0))
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("ADD");
        alu_op = 1;
		funct[4:1] = 4'b0100;
		funct[0] = 1'b0;

		#100

        assert((alu_control === 2'b00) & (flag_w === 2'b00) & (no_write === 0))
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("ADDS");
        alu_op = 1;
		funct[4:1] = 4'b0100;
		funct[0] = 1'b1;

		#100

        assert((alu_control === 2'b00) & (flag_w === 2'b11) & (no_write === 0))
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("SUB");
        alu_op = 1;
		funct[4:1] = 4'b0010;
		funct[0] = 1'b0;

		#100

        assert((alu_control === 2'b01) & (flag_w === 2'b00) & (no_write === 0))
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("SUBS");
        alu_op = 1;
		funct[4:1] = 4'b0010;
		funct[0] = 1'b1;

		#100

        assert((alu_control === 2'b01) & (flag_w === 2'b11) & (no_write === 0))
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("AND");
        alu_op = 1;
		funct[4:1] = 4'b0000;
		funct[0] = 1'b0;

		#100

        assert((alu_control === 2'b10) & (flag_w === 2'b00) & (no_write === 0))
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("ANDS");
        alu_op = 1;
		funct[4:1] = 4'b0000;
		funct[0] = 1'b1;

		#100

        assert((alu_control === 2'b10) & (flag_w === 2'b10) & (no_write === 0))
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("ORR");
        alu_op = 1;
		funct[4:1] = 4'b1100;
		funct[0] = 1'b0;

		#100

        assert((alu_control === 2'b11) & (flag_w === 2'b00) & (no_write === 0))
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("ORRS");
        alu_op = 1;
		funct[4:1] = 4'b1100;
		funct[0] = 1'b1;

		#100

        assert((alu_control === 2'b11) & (flag_w === 2'b10) & (no_write === 0))
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("CMP");
        alu_op = 1;
		funct[4:1] = 4'b1010;
		funct[0] = 1'b1;

		#100

        assert((alu_control === 2'b01) &
                    (flag_w === 2'b11) & 
                      (no_write === 1) )
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("MOV");
        alu_op = 1;
		funct[4:1] = 4'b1101;
		funct[0] = 1'b0;

		#100

        assert((alu_control === 2'b00) & 
                    (flag_w === 2'b00) & 
                      (no_write === 0) &
                     (alu_src_a === 1) )
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100

        $display("Not on Table Test");
        alu_op = 1;
		funct[4:1] = 4'b0011;
		funct[0] = 1'b1;

		#100

        assert((alu_control === 2'b00) &
                    (flag_w === 2'b00) & 
                      (no_write === 0) )
		else $error("Failed @ ALUOp=%b Funct [4:1](cmd)=%b Funct[0]=%b",
                     alu_op, funct[4:1], funct[0]);

        #100;

        //

    end

endmodule
/*
Test Bench para Register File
*/
module register_file_tb;

    logic               clk;
    logic               rst;
    logic  [3:0]       r_a1;
    logic  [3:0]       r_a2;
    logic  [3:0]         rd;
    logic [31:0]     result;
    logic [31:0]  pc_plus_8;
    logic         reg_write;
    logic [31:0]      src_a;
    logic [31:0] write_data;

    logic pcp8 = uut.q_r_15;

    register_file uut (.clk(clk),
                       .rst(rst),
                       .a_1(r_a1),
                       .a_2(r_a2),
                       .a_3(rd),
                       .wd_3(result),
                       .r_15(pc_plus_8),
                       .we_3(reg_write),
                       .rd_1(src_a),
                       .rd_2(write_data));

    initial begin
		$display("register_file Test Bench:\n");

		clk = 0;
		rst = 0;
        r_a1 = 4'b0;
		r_a2 <= 4'b0;
        rd <= 4'b0;
        result <= 32'b0;
        pc_plus_8 <= 32'b0;
        reg_write <= 1'b0;

		$monitor("rst=%b we_3=%b\n",       rst, reg_write,
                 "a_1=%b a_2=%b a_3=%b\n", r_a1, r_a2, rd,
                 "wd_3=%b r_15=%b\n",      result, pc_plus_8,
                 "rd_1=%b rd_2=%b\n",      src_a, write_data);
	end

    always begin
		#50 clk = !clk;
	end

    initial	begin

		#100

        rst = 1;

        #100

        rst = 0;

        #100

        $display("Se escribe al registro R0 con direccion en rd un 32'b1\n",
                 "pc + 8 siempre se escribe\n");

        r_a1 = 4'b1111;
		r_a2 <= 4'b1111;
        rd <= 4'b0000;
        result <= 32'b00000000000000000000000000000001;
        pc_plus_8 <= 32'b00000000000000000000000000001000;
        reg_write <= 1'b1;

        #100

        $display("Se escribe al registro R1 con direccion en rd un 32'b10\n",
                 "pc + 8 siempre se escribe\n");

        r_a1 = 4'b1111;
		r_a2 <= 4'b1111;
        rd <= 4'b0001;
        result <= 32'b00000000000000000000000000000010;
        pc_plus_8 <= 32'b00000000000000000000000000001100;
        reg_write <= 1'b1;

        #100
        
        $display("No se escribe a los registros, solo se leen los valores de los registros\n",
                 "pc + 8 siempre se escribe\n");

        r_a1 = 4'b0000;
		r_a2 <= 4'b0001;
        rd <= 4'b0011;
        result <= 32'b10101010101010101010101010101010;
        pc_plus_8 <= 32'b00000000000000000000000000010000;
        reg_write <= 1'b0;

        #100

        assert((src_a === 32'b00000000000000000000000000000001) &
               (write_data === 32'b00000000000000000000000000000010) &
               (uut.q_r_15 === 32'b00000000000000000000000000010000))
        else $error("Failed with inputs:\na_1=%b a_2=%b a_3=%b\n", r_a1, r_a2, rd);

        #100

        $display("Se siguen leyendo los valores de los registros R0 y R1,ahora en diferentes salidas\n",
                 "Se escribe al registro R2 con direccion en rd lo que estaba en result\n",
                 "pc + 8 siempre se escribe\n");

        r_a1 = 4'b0001;
		r_a2 <= 4'b0000;
        rd <= 4'b0010;
        result <= 32'b10101010101010101010101010101010;
        pc_plus_8 <= 32'b00000000000000000000000000010100;
        reg_write <= 1'b1;

        #100

        assert((src_a === 32'b00000000000000000000000000000010) &
               (write_data === 32'b00000000000000000000000000000001) &
               (uut.q_r_15 === 32'b00000000000000000000000000010100))
        else $error("Failed with inputs:\na_1=%b a_2=%b a_3=%b\n", r_a1, r_a2, rd);

        #100

        $display("Se leen ahora los valores de los registros R1 y R2\n",
                 "No se escribira nada aqui\n",
                 "pc + 8 siempre se escribe\n");

        r_a1 = 4'b0010;
		r_a2 <= 4'b0001;
        rd <= 4'b1111;
        result <= 32'b11111111111111111111111111111111;
        pc_plus_8 <= 32'b00000000000000000000000000011100;
        reg_write <= 1'b0;

        #100

        assert((src_a === 32'b10101010101010101010101010101010) &
               (write_data === 32'b00000000000000000000000000000010) &
               (uut.q_r_15 === 32'b00000000000000000000000000011100))
        else $error("Failed with inputs:\na_1=%b a_2=%b a_3=%b\n", r_a1, r_a2, rd);

        #100;



    end

    initial
	#1000 $finish;

endmodule

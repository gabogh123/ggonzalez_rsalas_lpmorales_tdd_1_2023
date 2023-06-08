module processor_tb;

    // Inputs
    logic  				clk;
	logic  				rst;
	logic [31:0] instruction;
	logic [31:0]   read_data;
	// Outputs
	logic [31:0] 		 pc;
	logic		  mem_write;
	logic [31:0]  alu_result;
	logic [31:0]  write_data;





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
        

		$monitor("instruction=%b\n",       instruction,
                 "read_data=%b\n",         read_data,
                 "pc=%b\n",                pc,
                 "mem_write=%b\n",         mem_write,
                 "alu_result=%b\n",        alu_result,
                 "write_data=%b\n",        write_data);
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

        $display("\n");

        instruction = 32'b11100011101000001100100000000101;
		read_data <= 32'b00000000011111100111111000000000;

        #100



        #100;

    end

    initial
	#2000 $finish;

endmodule
module ContadorReg_tb();
reg clk, reset,up_down;
wire [5:0] counter;

ContadorReg dut(reset, up_down, counter);

initial begin
reset=1;
up_down=0;
#20;
reset=0;
#200;
up_down=1;
end
endmodule 
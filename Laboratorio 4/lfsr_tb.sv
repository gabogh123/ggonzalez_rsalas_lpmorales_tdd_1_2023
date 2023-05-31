module lfsr_tb;

  reg clk;
  reg reset;
  wire [3:0] rand_lfsr;
  
  lfsr dut (
    .clk(clk),
    .reset(reset),
    .rand_lfsr(rand_lfsr)
  );

  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    reset = 1;
    #10 reset = 0;
    #500 $finish;
  end
  
  always @(posedge clk) begin
    $display("Random number: %b", rand_lfsr);
  end
  
endmodule

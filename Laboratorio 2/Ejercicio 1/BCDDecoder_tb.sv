module BCDDecoder_tb();

reg a,b,c,d;

reg [4:0]y;

BCDDecoder dut(a,b,c,d,y);

initial

	begin
	
		$monitor("a=%b b=%b c=%b d=%b y=%b",a,b,c,d,y);
	
      a=0;b=0;c=0;d=0;
		#40
      a=0;b=0;c=1;d=1;
		#40
      a=0;b=1;c=0;d=1;
		#40
      a=1;b=0;c=0;d=1;
		#40
		a=1;b=0;c=1;d=0;
		#40
      a=1;b=1;c=0;d=1;
		#40
      a=1;b=1;c=1;d=0;
		#40
      a=1;b=1;c=1;d=1;
		#40
		
		$finish;
		
    end
endmodule
		
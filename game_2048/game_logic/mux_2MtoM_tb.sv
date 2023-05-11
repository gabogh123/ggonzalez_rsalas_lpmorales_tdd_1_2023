module mux_2MtoM_tb();

	logic [11:0] M0 		 [3:0][3:0];
	logic [11:0] M1 		 [3:0][3:0];
	logic        S; 
	logic [11:0] OM 		 [3:0][3:0];

	mux_2MtoM m2mtom (M0, M1, S, OM);
	
	initial begin
		$monitor("Current State: %b\n", S,
				 "OM:\n%p\n%p\n%p\n%p\n", OM[3][3:0], OM[2][3:0],
										  OM[1][3:0], OM[0][3:0]);

		S = 0;
	end
	
	
	initial begin
	
		#50
	
		M0 = '{'{12'd233, 12'd232, 12'd231, 12'd230},
			   '{12'd223, 12'd222, 12'd221, 12'd220},
			   '{12'd213, 12'd212, 12'd211, 12'd210},
			   '{12'd203, 12'd202, 12'd201, 12'd200}};
	
		M1 = '{'{12'd133, 12'd132, 12'd131, 12'd130},
			   '{12'd123, 12'd122, 12'd121, 12'd120},
			   '{12'd113, 12'd112, 12'd111, 12'd110},
			   '{12'd103, 12'd102, 12'd101, 12'd100}};
		
		#100
				
		S = 1;
					
					
		#50;

	
	end

	initial
	#300 $finish;
	
endmodule

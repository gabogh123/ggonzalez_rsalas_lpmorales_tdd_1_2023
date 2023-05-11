module mux_4MtoM_tb();

	logic [11:0] M0 		 [3:0][3:0];
	logic [11:0] M1 		 [3:0][3:0];
	logic [11:0] M2 		 [3:0][3:0];
	logic [11:0] M3 		 [3:0][3:0];
	logic [1:0]  S; 
	logic [11:0] OM 		 [3:0][3:0];

	mux_4MtoM m4mtom (M0, M1, M2, M3, S, OM);
	
	initial begin/*
		$monitor("Current State: %b\n", S,
				 "OM:\n%p\n%p\n%p\n%p\n", OM[3][3:0], OM[2][3:0],
										  OM[1][3:0], OM[0][3:0]);*/

		S = 2'b00;
	end
	
	
	initial begin
	
		#50
	
		M0 = '{'{12'd433, 12'd432, 12'd431, 12'd430},
			   '{12'd423, 12'd422, 12'd421, 12'd420},
			   '{12'd413, 12'd412, 12'd411, 12'd410},
			   '{12'd403, 12'd402, 12'd401, 12'd400}};
	
		M1 = '{'{12'd133, 12'd132, 12'd131, 12'd130},
			   '{12'd123, 12'd122, 12'd121, 12'd120},
			   '{12'd113, 12'd112, 12'd111, 12'd110},
			   '{12'd103, 12'd102, 12'd101, 12'd100}};

		M2 = '{'{12'd233, 12'd232, 12'd231, 12'd230},
			   '{12'd223, 12'd222, 12'd221, 12'd220},
			   '{12'd213, 12'd212, 12'd211, 12'd210},
			   '{12'd203, 12'd202, 12'd201, 12'd200}};

		M3 = '{'{12'd333, 12'd332, 12'd331, 12'd330},
			   '{12'd323, 12'd322, 12'd321, 12'd320},
			   '{12'd313, 12'd312, 12'd311, 12'd310},
			   '{12'd303, 12'd302, 12'd301, 12'd300}};

		# 100
		
		$display("Current State: %b\n", S,
				 "OM:\n%p\n%p\n%p\n%p\n", OM[3][3:0], OM[2][3:0],
										  OM[1][3:0], OM[0][3:0]);
		
		
		#100
				
		S = 2'b01;

		#100

		$display("Current State: %b\n", S,
				 "OM:\n%p\n%p\n%p\n%p\n", OM[3][3:0], OM[2][3:0],
										  OM[1][3:0], OM[0][3:0]);

		#100
				
		S = 2'b10;

		#100


		$display("Current State: %b\n", S,
				 "OM:\n%p\n%p\n%p\n%p\n", OM[3][3:0], OM[2][3:0],
										  OM[1][3:0], OM[0][3:0]);

		#100
				
		S = 2'b11;

		#100

		$display("Current State: %b\n", S,
				 "OM:\n%p\n%p\n%p\n%p\n", OM[3][3:0], OM[2][3:0],
										  OM[1][3:0], OM[0][3:0]);
							
		#100

		

		#100;

	
	end

	initial
	#800 $finish;
	
endmodule
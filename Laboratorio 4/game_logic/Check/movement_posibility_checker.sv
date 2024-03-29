module movement_posibility_checker(/*clk,*/ enable, matrix, L);

	//input  logic clk;
	input  logic enable;
	input  logic [11:0] matrix [3:0][3:0];
	output logic L;
	
	logic [1:0] D;
	logic [1:0] Q;
	
	logic LL;
	logic LD;
	logic LU;
	logic LR;

	movement_posibility_by_side  left_check (/*clk,*/ enable, 4'b1000, matrix, LL);
	movement_posibility_by_side  down_check (/*clk,*/ enable, 4'b0100, matrix, LD);
	movement_posibility_by_side 	p_check (/*clk,*/ enable, 4'b0010, matrix, LU);
	movement_posibility_by_side right_check (/*clk,*/ enable, 4'b0001, matrix, LR);
						 
	assign L = LL | LD | LU | LR;
	
	

endmodule

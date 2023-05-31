module ALU_tb;

	parameter integer M = 4;
	
	reg  [M-1:0] 	A; // Operand
	reg  [M-1:0] 	B; // Operand
	reg  [3:0]	   F; // Operation
	
	wire [M-1:0]	R; // Result
	wire				C; // Carry
	wire				N; // Negative
	wire				V; // Overflow
	wire				Z; // Zero
	
	// Instancia de la ALU
	ALU_param # (.M(M)) alu (.A(A), .B(B), .F(F), .R(R), .C(C), .N(N), .V(V), .Z(Z));
	
	initial begin
	
		$display("\nALU 4bit Testbench");
		
		$monitor("Operando A: %b | Operando B: %b\nFuncion (F): %b\nResultado (R): %B\nC = %b, N = %b, V = %b, Z = %b",
					A, B, {F[3:2], ~F[1:0]}, R, C, N, V, Z);
		
		$display("\nSuma -> 0000");
		
		#10
		F[3:2] <= 2'b00; F[1:0] <= ~2'b00;
		A <= 4'b0100; B <= 4'b1001;
		#5
		assert(R === 4'b1101) else $error("failed");
		#10
		A <= 4'b0111; B <= 4'b1110;
		#10
		
		$display("\nResta -> 0001");
		
		#10
		F[3:2] <= 2'b00; F[1:0] <= ~2'b01;
		A <= 4'b1001; B <= 4'b0100;
		#5
		assert(R === 4'b0101) else $error("failed");
		#10
		A <= 4'b1110; B <= 4'b0111;
		#10
		

		
		$display("\nMultiplicacion -> 0100");
		
		#10
		F[3:2] <= 2'b01; F[1:0] <= ~2'b00;
		A <= 4'b0100; B <= 4'b0011;
		#5
		assert(R === 4'b1100) else $error("failed");
		#10
		A <= 4'b0010; B <= 4'b0100;
		#10
		
		$display("\nDivision -> 0101");
		
		#10
		F[3:2] <= 2'b01; F[1:0] <= ~2'b01;
		A <= 4'b1010; B <= 4'b0101;
		#5
		assert(R === 4'b1101) else $error("failed");
		#10
		A <= 4'b01100; B <= 4'b0011;
		#10
		
		$display("\nModulo -> 0110");
		
		#10
		F[3:2] <= 2'b01; F[1:0] <= ~2'b10;
		A <= 4'b0110; B <= 4'b0100;
		#5
		assert(R === 4'b0010) else $error("failed");
		#10
		A <= 4'b1101; B <= 4'b0011;
		#10
		

		
		$display("\nAnd -> 1000");
		
		#10
		F[3:2] <= 2'b10; F[1:0] <= ~2'b00;
		A <= 4'b0111; B <= 4'b0101;
		#10
		A <= 4'b1111; B <= 4'b1111;
		#10
		
		$display("\nOr -> 1001");
		
		#10
		F[3:2] <= 2'b10; F[1:0] <= ~2'b01;
		A <= 4'b1111; B <= 4'b0101;
		#10
		A <= 4'b0010; B <= 4'b1010;
		#10
		
		$display("\nXor -> 1010");
		
		#10
		F[3:2] <= 2'b10; F[1:0] <= ~2'b10;
		A <= 4'b0000; B <= 4'b0110;
		#10
		A <= 4'b0101; B <= 4'b1010;
		#10
		

		
		$display("\nShift L -> 1100");
		
		#10
		F[3:2] <= 2'b11; F[1:0] <= ~2'b00;
		A <= 4'b0110; B <= 4'b0001;
		#10
		A <= 4'b0001; B <= 4'b0011;
		#10
		
		$display("\nShift R -> 1101");
		
		#10
		F[3:2] <= 2'b11; F[1:0] <= ~2'b01;
		A <= 4'b1110; B <= 4'b0011;
		#10
		A <= 4'b1001; B <= 4'b0100;
		#10
		
		#10;
	
	end
	
endmodule

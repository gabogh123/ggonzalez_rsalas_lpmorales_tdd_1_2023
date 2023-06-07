/*
Test Bench de Condition Checker de Conditional Logic del Control Unit
*/
module condition_checker_tb;

    logic [3:0]  cond;
    logic           N;
    logic           Z;
    logic           C;
    logic           V;
    logic     cond_ex;

    condition_checker uut (.cond(cond),
                           .N(N),
                           .Z(Z),
                           .C(C),
                           .V(V),
                           .cond_ex(cond_ex));

    initial begin
		$display("condition_checker Test Bench:\n");

		cond <= 4'b1111;
        N <= 0;
        Z <= 0;
        C <= 0;
        V <= 0;

		$monitor("\ncond=%b\n", cond,
                 "N=%b Z=%b C=%b V=%b\n", N, Z, C, V,
                 "cond_ex=%b", cond_ex);
    end

    initial	begin
	
		#100

        $display("EQ");
        cond = 4'b0000;
        N = 0;
        Z = 1;
        C = 0;
        V = 0;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("EQ");
        cond = 4'b0000;
        N = 1;
        Z = 0;
        C = 1;
        V = 1;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("NE");
        cond = 4'b0001;
        N = 0;
        Z = 0;
        C = 0;
        V = 0;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("NE");
        cond = 4'b0001;
        N = 1;
        Z = 1;
        C = 1;
        V = 1;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("CS/HS");
        cond = 4'b0010;
        N = 0;
        Z = 0;
        C = 1;
        V = 0;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("CS/HS");
        cond = 4'b0010;
        N = 1;
        Z = 1;
        C = 0;
        V = 1;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("CC/LO");
        cond = 4'b0011;
        N = 1;
        Z = 1;
        C = 0;
        V = 1;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("CC/LO");
        cond = 4'b0011;
        N = 0;
        Z = 0;
        C = 1;
        V = 0;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("MI");
        cond = 4'b0100;
        N = 1;
        Z = 0;
        C = 0;
        V = 0;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("MI");
        cond = 4'b0100;
        N = 0;
        Z = 1;
        C = 1;
        V = 1;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("PL");
        cond = 4'b0101;
        N = 0;
        Z = 1;
        C = 1;
        V = 1;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("PL");
        cond = 4'b0101;
        N = 1;
        Z = 0;
        C = 0;
        V = 0;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("VS");
        cond = 4'b0110;
        N = 0;
        Z = 0;
        C = 0;
        V = 1;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("VS");
        cond = 4'b0110;
        N = 1;
        Z = 1;
        C = 1;
        V = 0;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("VC");
        cond = 4'b0111;
        N = 1;
        Z = 1;
        C = 1;
        V = 0;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("VC");
        cond = 4'b0111;
        N = 0;
        Z = 0;
        C = 0;
        V = 1;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("HI");
        cond = 4'b1000;
        N = 0;
        Z = 0;
        C = 1;
        V = 0;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("HI");
        cond = 4'b1000;
        N = 1;
        Z = 0;
        C = 0;
        V = 1;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("LS");
        cond = 4'b1001;
        N = 0;
        Z = 1;
        C = 1;
        V = 0;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("LS");
        cond = 4'b1001;
        N = 1;
        Z = 0;
        C = 1;
        V = 1;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("GE");
        cond = 4'b1010;
        N = 1;
        Z = 0;
        C = 0;
        V = 1;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("GE");
        cond = 4'b1010;
        N = 0;
        Z = 1;
        C = 0;
        V = 1;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("LT");
        cond = 4'b1011;
        N = 1;
        Z = 0;
        C = 1;
        V = 0;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("LT");
        cond = 4'b1011;
        N = 0;
        Z = 1;
        C = 1;
        V = 0;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("GT");
        cond = 4'b1100;
        N = 1;
        Z = 0;
        C = 0;
        V = 1;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("GT");
        cond = 4'b1100;
        N = 1;
        Z = 1;
        C = 1;
        V = 1;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("LE");
        cond = 4'b1101;
        N = 0;
        Z = 1;
        C = 1;
        V = 0;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("LE");
        cond = 4'b1101;
        N = 0;
        Z = 0;
        C = 1;
        V = 0;

		#100

        assert ((cond_ex === 0)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("AL");
        cond = 4'b1111;
        N = 0;
        Z = 0;
        C = 0;
        V = 0;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100

        $display("AL");
        cond = 4'b1111;
        N = 1;
        Z = 1;
        C = 1;
        V = 1;

		#100

        assert ((cond_ex === 1)) 
        else $error("Failed @ cond=%b N=%b Z=%b C=%b V=%b", cond, N, Z, C, V);

        #100;

        //

    end

endmodule

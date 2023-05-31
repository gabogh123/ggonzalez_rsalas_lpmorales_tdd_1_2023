module score_tb();
    logic [11:0] score;
    logic [11:0] mat [3:0][3:0] = '{'{12'd4, 12'd8, 12'd0, 12'd0}, 
                                    '{12'd0, 12'd0, 12'd0, 12'd0},
                                    '{12'd0, 12'd2048, 12'd0, 12'd0},
                                    '{12'd2, 12'd0, 12'd0, 12'd0}};

    score dut(mat, score);

	initial begin

        #10
        assert (score === 12'd2408) 
        else   $error("failed score = %d", score);
    end
endmodule

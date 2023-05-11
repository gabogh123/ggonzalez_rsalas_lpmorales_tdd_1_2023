module new_tile_gen_tb();

    logic clk;
    logic enable;
    logic rand_pos;
    logic [11:0] matrix_Q [3:0][3:0];
    logic [11:0] matrix_D [3:0][3:0];

    new_tile_gen uut (/*clk,*/ enable, rand_pos, matrix_Q, matrix_D); 



endmodule

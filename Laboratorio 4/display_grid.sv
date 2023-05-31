module display_grid(
        input logic [9:0] x, y,
        output logic in_grid
    );

    logic [9:0] grid_areas;

    assign grid_areas[9] = ( x >= 10'd16 & x <= 10'd463 & y >= 10'd16 & y <= 10'd23);
    assign grid_areas[8] = ( x >= 10'd16 & x <= 10'd463 & y >= 10'd126 & y <= 10'd133);
    assign grid_areas[7] = ( x >= 10'd16 & x <= 10'd463 & y >= 10'd236 & y <= 10'd243);
    assign grid_areas[6] = ( x >= 10'd16 & x <= 10'd463 & y >= 10'd346 & y <= 10'd353);
    assign grid_areas[5] = ( x >= 10'd16 & x <= 10'd463 & y >= 10'd456 & y <= 10'd463);

    assign grid_areas[4] = ( x >= 10'd16 & x <= 10'd23 & y >= 10'd16 & y <= 10'd463);
    assign grid_areas[3] = ( x >= 10'd126 & x <= 10'd133 & y >= 10'd16 & y <= 10'd463);
    assign grid_areas[2] = ( x >= 10'd236 & x <= 10'd243 & y >= 10'd16 & y <= 10'd463);
    assign grid_areas[1] = ( x >= 10'd346 & x <= 10'd353 & y >= 10'd16 & y <= 10'd463);
    assign grid_areas[0] = ( x >= 10'd456 & x <= 10'd463 & y >= 10'd16 & y <= 10'd463);

    or_n_inputs #(10) or_in_grid(grid_areas, in_grid);

endmodule

module BCDDecoder_tb();
    logic w, y;
    BCDDecoder modulo(w,y);
    initial begin
    $display("Inciando Simulacion");
    w = 4'b0001;
    #5
    assert(y === 5'b00000) else $error("01 failed");
    w = 4'b0100;
    #40
    w = 4'b0101;
    #40
    w = 4'b0111;
    #40
    w = 4'b1001;
    #40
    w = 4'b1010;
    #40
    w = 4'b1100;
    #40
    w = 4'b1110;
    #40
    w = 4'b1111;
    #40
    end
endmodule
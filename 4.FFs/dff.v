//DFF without reset

module D_FF(input D,Clk,rst, output reg Q);

    // Q = 0 when reset
    always @(posedge Clk, negedge rst)
        if(!rst)    Q <= 1'b0;
        else        Q <= D;
endmodule

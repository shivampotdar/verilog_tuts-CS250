
module jkff_dff(input J,K,Clk,rst,output Q);

    wire D;
    assign D = (!Q & J)|(!K & Q);

    D_FF dff(D,Clk,rst,Q);

endmodule

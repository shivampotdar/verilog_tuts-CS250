// tff from dff, input is xor(d,t)

module tff_dff(input T,Clk,rst, output Q);
    // here Q need not be reg since it is already one in the dff, we only draw it out with a wire
    wire D;

    assign D = T ^ Q;
    // or xor(D,T,Q)
    D_FF dff(D,Clk,rst,Q);

endmodule

module dlatch_b (input D,En,output reg Q);
    always @(D,En)
    //latch - level trig, D can change midway
    begin
        if(En)
             Q <= D;
    end
endmodule // dlatch_binput

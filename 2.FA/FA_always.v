// FA

module FA_always(sum, carry_out, a, b, carry_in);
    
    input a,b,carry_in;
    output reg sum, carry_out;
    /* inside @always block only regs can be assigned
    also without reg written, input output is defaulted 
    to a wire */
  
    always @(a,b,carry_in)  //sensitivity list, always @* means all signals
        begin
            sum = (~a & ~b & carry_in) | (~a & b & ~carry_in) | (a & ~b & ~carry_in) | (a & b & carry_in);
            carry_out = (a & b) | (b & carry_in) | (carry_in & a);
        end
        
endmodule

// FA

module FA(sum, carry_out, a, b, carry_in);

    input a,b,carry_in;
    output sum, carry_out;

    assign sum = (~a & ~b & carry_in) | (~a & b & ~carry_in) | (a & ~b & ~carry_in) | (a & b & carry_in);
    assign carry_out = (a & b) | (b & carry_in) | (carry_in & a);

endmodule

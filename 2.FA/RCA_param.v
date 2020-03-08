// 4 bit RCA

module RCA_param(Sum, carry_out, A, B, carry_in);

    parameter N = 4;    //# define equivalent of Verilog

    input [N-1:0] A, B;   /* A and B are 4 elements */

    input carry_in;
    output [N-1:0] Sum;
    output carry_out;

    wire [N:0] w; //n-1 wires needed

    assign w[0] = (carry_in);
    assign carry_out = (w[N]);

    genvar i;   // variable for using generator block

    for(i=0;i<N;i=i+1)
    begin
        FA fa0(.sum(Sum[i]),.carry_out(w[i+1]),.a(A[i]),.b(B[i]),.carry_in(w[i]));
        //instantiate and assign explicitly
    end

endmodule

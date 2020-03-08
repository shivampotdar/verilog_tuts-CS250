// 4 bit RCA

module RCA_4b(Sum, carry_out, A, B, carry_in);

    input [3:0] A, B;   /* A and B are 4 elements */
    /* input [3:0] A[3:0] means every element of A is 4b array*/
    input carry_in;
    output [3:0] Sum;
    output carry_out;

    wire w0_1, w1_2, w2_3;  /* wires to connect 4FA blocks
    with each other */

    FA fa0(Sum[0],w0_1, A[0], B[0], carry_in);
    FA fa1(Sum[1],w1_2, A[1], B[1], w0_1);
    FA fa2(Sum[2],w2_3, A[2], B[2], w1_2);
    FA fa3(Sum[3],carry_out, A[3], B[3], w2_3);

endmodule

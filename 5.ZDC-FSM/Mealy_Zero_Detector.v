module Mealy_Zero_Detector(
    output reg y_out,
    input x_in, clock, reset
    );

    // this is mealy so needs combi+seq part
    reg [1:0] state, next_state;
    parameter  S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

    // 3 always blocks - 1 for ns, 1 for yout, 1 to change state

    //1 - output, y_out
    always @(state,x_in)
        case (state)
            S0: y_out = 0;
            S1,S2,S3: y_out = ~x_in;
        endcase

    //2 - next_state
    always @ (state,x_in)
        case (state)
            S0: if (x_in) next_state = S1; else next_state = S0;
            S1: if (x_in) next_state = S3; else next_state = S0;
            S2: if (~x_in) next_state = S0; else next_state = S2;
            S3: if (x_in) next_state = S2; else next_state = S0;
        endcase

    //3 - update state at clk egde
    always @ (posedge clock, negedge reset )
        begin
            if (!reset == 0) state <= S0;
            else state <= next_state;
        end
endmodule

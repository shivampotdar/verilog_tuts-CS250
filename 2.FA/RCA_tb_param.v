// 4 bit RCA

module RCA_tb_param();

    parameter N = 4;    //# define equivalent of Verilog
    reg [N-1:0] A,B;
    reg carry_in;
    wire [N-1:0] Sum;
    wire carry_out;

    RCA_param #(.N(N)) rca_param_dut(.Sum(Sum),.carry_out(carry_out),.A(A),.B(B),.carry_in(carry_in));
    // instantiate n times and pass values

    initial begin
        $monitor($time,"Sum: %b, carry_out: %b, A: %b, B: %b, carry_in: %b.",Sum,carry_out,A,B,carry_in);

        repeat(15)
        begin
            #5
            A = $random;
            B = $random;
            carry_in = $random;
        end
        #10 $finish;
    end

endmodule

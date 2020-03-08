module TB_RCA_4b_random();

    reg [3:0] A,B;
    reg carry_in;
    wire [3:0] Sum;
    wire carry_out;

    RCA_4b rca_4b_dut_rdm(Sum,carry_out,A,B,carry_in);

    initial begin
        $monitor($time,"Sum: %b, carry_out: %b, A: %b, B: %b, carry_in: %b.",Sum,carry_out,A,B,carry_in);

        /* $random - signed random
         urandom - unsgn random*/
        repeat(10) begin    //reeats 10 times
         #5
         A = $random;
         B = $random;
         carry_in = $random;
        end

         #10 $finish;
    end
endmodule    

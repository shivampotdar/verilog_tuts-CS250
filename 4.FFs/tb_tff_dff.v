module tb_tff_dff();

    reg T,Clk,rst;
    wire Q;

    tff_dff tff1(T,Clk,rst,Q);

    //reset
    initial begin
        rst = 1;
        #1 rst = 0;
        // make negedge
        #1 rst = 1;
    end

    //clock
    initial begin
        $dumpfile("tff_dff.vcd");
        $dumpvars(0,tb_tff_dff);

        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    //input
    initial begin
        T = 0;
        #8; //3 units after clock
        repeat(10)
        begin
            T = ~T;
            #10; //Tp of clock
        end
        $finish;
    end

endmodule

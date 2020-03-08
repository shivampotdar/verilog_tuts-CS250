module tb_jkff_dff();

    reg J,K,Clk,rst;
    wire Q;

    jkff_dff tff1(J,K,Clk,rst,Q);

    //reset
    initial begin
        rst = 1;
        #1 rst = 0;
        // make negedge
        #1 rst = 1;
    end

    //clock
    initial begin
        $dumpfile("jkff_dff.vcd");
        $dumpvars(0,tb_jkff_dff);

        Clk = 0;
        forever #5 Clk = ~Clk;
    end

    //input
    initial begin
        J = 0; K=0;
        #10 J = 0; K=1;
        #10 J = 1; K =0;
        #10 J = 1; K = 1;
        #10 $finish;
    end
endmodule

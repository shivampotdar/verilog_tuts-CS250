module tb_dff();
    reg D,Clk,rst;
    wire Q;

    D_FF dff1(D,Clk,rst,Q);

    //create clock
    initial begin
        Clk = 0;
        forever
        #5 Clk = ~Clk;
    end

    //stimulus
    initial begin

    $dumpfile("dff.vcd");
    $dumpvars(0,tb_dff);

        D = 0;
        repeat(10) begin
            #1 D = ~D;
            #2 D = ~D;
            #5 D = ~D;
        end

        #5 $finish;
    end

    //monitor
    always @(Q) begin
    // run only when Q changes
        if (Q!=D)
         fail();
         // this is function, called task in verilog
        else
         pass();
    end

    task fail;
        begin
         $display($time,". Module D-Latch Fail. Q: %b, D: %b",Q,D);
        end
    endtask

    task pass;
        begin
         $display($time,". Module D-Latch Pass. Q: %b, D: %b",Q,D);
        end
    endtask

endmodule

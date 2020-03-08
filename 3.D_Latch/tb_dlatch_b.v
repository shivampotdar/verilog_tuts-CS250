module tb_dlatch();
    reg D,En;
    wire Q;

    dlatch_b dl1(D,En,Q);

    //create clock
    initial begin
        En = 0;
        forever
        #5 En = ~En;
    end

    //stimulus
    initial begin
        D = 0;
        repeat(8) begin
            #1 D = ~D;
            #2 D = ~D;
            #4 D = ~D;
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

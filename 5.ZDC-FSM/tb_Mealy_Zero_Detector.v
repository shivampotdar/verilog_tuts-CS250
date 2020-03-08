module tb_Mealy_Zero_Detector();

    wire t_y_out;
    reg t_x_in, t_clock, t_reset;

    Mealy_Zero_Detector M0(t_y_out, t_x_in, t_clock, t_reset);

    initial #200 $finish;
    initial
    begin
        t_clock = 0;

        $dumpfile("Mealy_Zero_Detector.vcd");
        $dumpvars(0,M0);

        forever #5 t_clock = ~t_clock;
    end

    initial begin
        fork
                t_reset = 0;
            #2  t_reset = 1;
            #10 t_x_in = 1;
            #30 t_x_in = 0;
            #40 t_x_in = 1;
            #50 t_x_in = 0;
            #52 t_x_in = 1;     // glitch
            #54 t_x_in = 0;
            #70 t_x_in = 1;
            #80 t_x_in = 0;
            #90 t_x_in = 1;
        join
    end

endmodule

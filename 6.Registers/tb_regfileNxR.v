module tb_regfileNxR();

integer i;
parameter N = 8;
parameter R = 32;
parameter RR = $clog2(R);

reg [N-1:0] data_in;
reg [RR-1:0] reg_id_r,reg_id_w;
reg r,wr,clk,rst;
wire [N-1:0] data_out;

regfileNxR regfile32x8(data_in,reg_id_w,reg_id_r,wr,clk,rst,data_out);

//clock
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

//reset behavior
initial begin
    #1 rst = 1;
    #1 rst = 0;
    $dumpfile("reg_file.vcd");
    $dumpvars(0,tb_regfileNxR);

    #1500 $finish;
end

//stimulus
initial begin
    i=0;
    #5; //wait for reset
    for(i=0;i<R;i=i+1)
    begin
        //apply at posedge
        data_in = $random;
        reg_id_w = i;
        wr = 1;
        #10; //wait for posedge clock
        wr = 0;
        #10;
    end
end

//read from RF
initial begin
    #705; // 640 required to load the reg, posedge at 710
    repeat(20)
    begin
        reg_id_r = $random%R;
        #20;
    end
end
endmodule

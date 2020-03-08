module tb_regN();

parameter N = 8;
reg [N-1:0] data_in;
reg clk,rst,wr;

wire [N-1:0] data_out;

regN registerN (data_in,data_out,clk,wr,rst);

//reset behavior, clear the reg
initial begin
    rst = 0;
    #1 rst = 1;
    #1 rst = 0;
end

//clock
initial begin
    clk = 0;
    forever #10 clk = ~clk;
end

//write and read

// * for the write signal to occur at every alternate clock edge, this loop shall have a total delay of 2Tp, otherwise the whole thing gets shifted!

initial begin
    wr = 0;
    #5;
    repeat(10) begin
        wr = 1;
        data_in = $random%256;
        #10; //posedge arrives at 10, keep on till 15, then off for one cycle
        wr = 0;
        #30;
    end
    $finish;
end

//gtkwave stuff
initial begin
    $dumpfile("tb_regN.vcd");
    $dumpvars(0,tb_regN);
end


endmodule

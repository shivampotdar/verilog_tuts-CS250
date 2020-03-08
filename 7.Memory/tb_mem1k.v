module tb_mem1k();

    reg [7:0] data_in;
    wire [7:0] data_out;

    reg rd,wr,cs,clk;
    reg [9:0] read_address, write_address;

    mem1k MEMORY(data_in,write_address, read_address, data_out, rd, wr, cs, clk);

    initial begin
        clk = 0;
        cs = 1;
        rd = 0;
        wr = 0;
        read_address = 8'h00;
        write_address = 8'h00;
        data_in = 8'h00;

        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("mem.vcd");
        $dumpvars(0,tb_mem1k);

        #250 $finish;
    end

    //random rd and write
    initial begin
        #10;
        rd = 1;
        wr = 1;
        repeat(20)
        begin
            #10;
            read_address = $random%1024;
            write_address = (($random%1024)+100)%1024;
            data_in = $random%256;
        end
    #10;
        read_address = $random % 1024;
        write_address = read_address;
    end
endmodule

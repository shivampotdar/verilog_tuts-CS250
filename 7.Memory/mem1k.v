module mem1k(data_in,write_address, read_address, data_out, rd, wr, cs, clk);

    input [7:0] data_in;
    output [7:0] data_out;
    input rd,wr,cs,clk;
    input [9:0] read_address, write_address; //10 bit sel lines

    reg [7:0] memory_array[0:1023]; //the main 1K block
    reg [7:0] d_out;

    initial begin
        $readmemb("mem.dat",memory_array,0,1023);
    end

    //read operation
    always @(posedge clk)
    begin
        if(cs & rd) begin
            if(wr==1'b1 && (read_address == write_address))
                d_out = 8'bx;
            else
                d_out = memory_array[read_address];
        end
    end

    assign data_out = d_out;

    // write
    always @ (posedge clk) begin
        if(cs && wr) begin
            memory_array[write_address] = data_in;
        end
    end

endmodule

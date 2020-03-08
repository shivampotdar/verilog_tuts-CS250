// data_out is continuous and data read when wr = 1;
module regN (data_in,data_out,clk,wr,rst);

parameter N = 8;

input [N-1:0] data_in;
input clk,rst;
input wr;
output [N-1:0] data_out;

reg [N-1:0] register;

//reset behavior, async
always @ (rst) begin
    if(rst)
        register <= 0;
end

//write behavior
always @ (posedge clk) begin
    if(!rst && wr)
        register <= data_in;
end

//read behavior
assign data_out = register;

endmodule // regNdata_in,data_out,clk,wr,rst

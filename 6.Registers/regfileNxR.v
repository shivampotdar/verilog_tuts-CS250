module regfileNxR(data_in,reg_id_w,reg_id_r,wr,clk,rst,data_out);

integer i;
parameter N = 8;
parameter R = 32;
parameter RR = $clog2(R);

input [N-1:0] data_in;
input [RR-1:0] reg_id_r,reg_id_w;
input wr,clk,rst;
output reg [N-1:0] data_out;

reg [N-1:0] reg_file[R-1:0];
// 32(R) instances of 8(N) bit registers

//reset behavior
always @(rst) begin
    if(rst)
    begin
        for(i=0;i<R;i=i+1)
            reg_file[i] <= 0;   // parallel load 0
    end
end

//write behavior
always @(posedge clk) begin
    if(wr && !rst) begin
        reg_file[reg_id_w] = data_in;
    end
end

/* can also be specifed as (BUT NOT CLOCK DEPENDENT)
assign data_out = (!wr || reg_id_r!=reg_id_w)?reg_file[reg_id_r]:8'b0;
synthesis in ISE has both FFs and registers
*/

//read behavior
always @ (posedge clk) begin
    if(!rst)
        if(!wr || (reg_id_r != reg_id_w))       // if there is no write happening, no problem. if yes, check equality
            data_out <= reg_file[reg_id_r];
        else
            data_out <= 8'bxxxx_xxxx;
end
endmodule

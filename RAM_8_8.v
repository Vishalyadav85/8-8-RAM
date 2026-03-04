`timescale 1ns / 1ps

module RAM_8_8(
input clk,
input rst,
input wr_en,
input [2:0]w_addr,
input [7:0] data_in,
input [2:0] rd_addr,
output reg [7:0] data_out
);
reg [7:0] memory[0:7];
integer i;

always@(posedge clk or posedge rst)
begin
if(rst)
for(i=0;i<8;i=i+1'b1)
memory[i]<=8'b0000_0000;
end

// Memory read and Write Logic
always@(posedge clk or posedge rst)
begin
if(rst)
data_out=8'b0000_0000;
else if(wr_en)
memory[w_addr]=data_in;
else
data_out=memory[rd_addr];
end
endmodule

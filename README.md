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

// **********Testbench to test the working of the RAM *******************///////

`timescale 1ns / 1ps

module RAM_tb();
reg clk,rst,wr_en;
reg [2:0] w_addr;
reg [2:0] rd_addr;
reg [7:0] data_in;
wire [7:0]data_out;
RAM_8_8 dut(.clk(clk),.rst(rst),.wr_en(wr_en),.w_addr(w_addr),
.data_in(data_in),.rd_addr(rd_addr),.data_out(data_out));
initial begin
clk=1'b0;
forever #5 clk=~clk;
end
initial begin
rst=1'b1;
wr_en=1'b0;
rd_addr=3'b001;
#10 rst=1'b0;
    wr_en=1'b1;
    w_addr=3'b111;
    data_in=8'b1000_1111;
#10 w_addr=3'b000;
    data_in=8'b0000_0000;
#10 w_addr=3'b001;
    data_in=8'b0000_0001;
#10 w_addr=3'b010;
    data_in=8'b0000_0010;
#10 w_addr=3'b011;
    data_in=8'b0000_1111;  
#10 wr_en=1'b0;
    rd_addr=3'b111;
#10 wr_en=1'b0;
     rd_addr=3'b001;
#10 wr_en=1'b0;
    rd_addr=3'b011;
$monitor("Time=%t | wr_en=%b | rst=%b | w_addr=%b | data_in=%b | rd_addr=%b | data_out=%b",
$time,wr_en,rst,w_addr,data_in,rd_addr,data_out);
#100 $finish;
end
endmodule

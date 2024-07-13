`timescale 1ns/1ns
`include "nazi.v"
module nazi_tb;
reg clk;
reg data_in;
wire data_out;
integer i,j;
nazi DUT(data_in,clk,data_out);
always #10 clk=~clk;
initial
begin
clk=0;
data_in=1'b0;
$dumpfile("nazi_tb.vcd");
$dumpvars(0,nazi_tb);
for( i=10;i>=0;i--)
begin
for(j=$urandom_range(10);j>0;j--)
begin
#20
if(i%2==0)
data_in= j%2==0?1'b1:1'b0;
else
begin
    if(i>5)
data_in= 1'b1;
else
data_in= 1'b0;
end
end
end
$finish;
end
endmodule
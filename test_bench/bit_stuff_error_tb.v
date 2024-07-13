`timescale 1ns/1ns
`include "bit_stuff_error.v"
module test();
reg in,clk,rst;
output error;
initial clk = 0;
bit_stuff_error dut(error,in,clk,rst);
always #10 clk = ~clk;
initial
begin
      $dumpfile("bit_stuff_tb.vcd");
     $dumpvars(0,test);
    rst = 1;
    #10 rst =0;
    #10 in=1;
    for(integer i=0;i<9;i++)
    #20 in=1;
    #20 
    $finish;
end
endmodule
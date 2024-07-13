`timescale 1ns/1ns
`include "syn_detector.v"
module syn_tb();
reg in_data,reset,clk,diff;
wire syn_out,se0;
always #10  clk =  ~clk;
syn_detector Dut(syn_out,se0,reset,in_data,diff,clk);
initial begin
    clk = 0;
    $dumpfile("syn_tb.vcd");
$dumpvars(0,syn_tb);
    #10 reset = 1;
    #20 reset= 0;diff=1; in_data = 0;
    #20 in_data = 0;#20 in_data = 0;#20 in_data = 0;#20 in_data = 0;#20 in_data = 0;#20 in_data = 1;#20 in_data = 1;
    #20 diff=0;
    #40 diff=1;in_data=1;
    #40
$finish;
end
endmodule
`timescale 1ns/1ns
`include "shift_hold_reg.v"
module sipo_tb();
reg clk,si,sel;
wire [7:0] po;
shift_and_hold_reg dut (.parallel_out(po),.clk(clk),.serial_in(si),.select_pin(sel));
initial begin
    clk=0;
end
always #10 clk = ~clk;
initial
begin
    $dumpfile("sipo_tb.vcd");
$dumpvars(0,sipo_tb);
   sel =0;
    #2 sel =1;
    #8 si = 1;
    for (integer i=0; i<25 ; i++) begin
        #20 si =$urandom_range(1);
    end
    #10 $finish;
end

endmodule

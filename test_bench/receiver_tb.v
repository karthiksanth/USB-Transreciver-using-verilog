`timescale 1ns/1ns
`include "receiver.v"
module Receiver_test();
  wire Rx_Valid,Rx_Ready,Rx_Error;
 wire [7:0]Data_Out;
    reg Data_In,Clk,Tx_Ready,Active,Diff;
    Receiver_module DUT(Data_Out,Rx_Valid,Rx_Ready,Rx_Error,Data_In,Clk,Tx_Ready,Active,Diff);
    initial Clk =0;
    always #10 Clk = ~Clk;
    initial
    begin
         $dumpfile("Receiver_tb.vcd");
         $dumpvars(0,Receiver_test);
        Active =0;
        #1 Active =1;
        Tx_Ready =0;Diff=1;
        #9 Data_In = 0;
    #19 Data_In = 0;#19 Data_In = 0;#19 Data_In = 0;#19 Data_In = 0;#19 Data_In = 0;#19 Data_In = 1;#19 Data_In = 1;
        for(integer i= 0;i<40;i++)
        begin
            #19 Data_In = $urandom_range(1);
        end
        #20 Diff =0;
        #20 Diff =0;
        #20 Diff =1; Data_In=1;
        // #40
        $finish;
    end
endmodule
`include "module/Bit_Destuff.v"
`include "module/NRZI_Decoder.v"
`include "Receiver_State_Machine.v"
`include "module/Shift_Hold_Reg.v"

module Receiver_module(Data_Out,Diff,
                       Rx_Valid,Rx_Ready,Rx_Error,
                       Data_In,Clk,Tx_Ready,Active);
    output Rx_Valid,Rx_Ready,Rx_Error;
    output [7:0]Data_Out;
    input Data_In,Clk,Tx_Ready,Active,Diff;
    wire Nazi_Clk,Nazi_Out,Data,Error,flag,Bit_out,Shift_clk,D_Sync,valid_bit;
    assign Nazi_Clk = Data & Clk ;
    assign Shift_clk = Nazi_Clk & (!flag);
    assign Rx_Error = Error;
    assign Rx_Ready = D_Sync;
    assign Rx_Valid = valid_bit;
    Receiver_State_Machine Receiver_State_Machine_instant (Data,
                                                           Error,D_Sync,
                                                           Tx_Ready,Active,
                                                           Data_In,Diff,Clk);
    Nazi_Decoder Nazi_Decoder_instant(.Nazi_Decoder_Data_In(Data_In),
                                        .Nazi_Decoder_Clk(Shift_clk),
                                        .Nazi_Decoder_Data_Out(Nazi_Out));
    Bit_Unstuffer Bit_Unstuffer_instant(.Bit_Unstuffer_Data_Out(Bit_out),
                                        .Bit_Unstuffer_Flag(flag),
                                        .Bit_Unstuffer_Data_In(Nazi_Out),
                                        .Bit_Unstuffer_Clk(Nazi_Clk));
    shift_and_hold_reg shift_and_hold_reg_instant(.shift_and_hold_reg_Data_Out(Data_Out),
                                                    .valid_bit(valid_bit),
                                                    .shift_and_hold_reg_Clk(Shift_clk),
                                                    .shift_and_hold_reg_Data_In(Bit_out),
                                                    .select_pin(Data));

endmodule

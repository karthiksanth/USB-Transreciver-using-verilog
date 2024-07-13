module ShiftRegister_PIPO(Clk,Pi,Po,sel);
input Clk;
input [7:0]Pi;
output reg [7:0]Po;
always @(posedge sel)
begin
    Po=0;
end
always @(negedge Clk)
begin
Po = Pi;
end
endmodule
module Shiftregister_PISO(Clk, Parallel_In,load, Serial_Out);
input Clk,load;
input [7:0]Parallel_In;
output reg Serial_Out;
reg [7:0]tmp;
always @(posedge Clk)
begin
if(load)
tmp<=Parallel_In;
else
begin
Serial_Out<=tmp[7];
tmp<={tmp[6:0],1'b0};
end
end
endmodule
module Tx_Shift_Hold(Tx_Shift_Hold_Data_Out,Tx_Shift_Hold_Data_In,Tx_Shift_Hold_Clk,sel);
input [7:0] Tx_Shift_Hold_Data_In; 
input Tx_Shift_Hold_Clk,sel;
output Tx_Shift_Hold_Data_Out;
wire [7:0] PIPO_data_Out;
ShiftRegister_PIPO ShiftRegister_PIPO_instant(.Clk(Tx_Shift_Hold_Clk),
                                              .Pi(Tx_Shift_Hold_Data_In),
                                              .Po(PIPO_data_Out),
                                              .sel(sel));

Shiftregister_PISO Shiftregister_PISO_instant(.Clk(Shiftregister_PISO), .Parallel_In(PIPO_data_Out),load, Serial_Out);
endmodule
`timescale 1ns/1ns
module Sync_Detector(Syn_Out,SE0,Reset,Sync_Detector_Data_In,Diff,Sync_Detector_Clk);
output reg Syn_Out,SE0;
input Reset, Sync_Detector_Data_In,Sync_Detector_Clk,Diff;
reg [3:0] state;
always @(Reset)
begin
     if ( Reset)
    begin
        state = 4'b000;
        Syn_Out=1'b0;
        SE0=0;
    end
end
always @(posedge Sync_Detector_Clk)
begin
begin
case(state)
4'b0000 :
begin if(Sync_Detector_Data_In==0 & Diff)
begin
state=4'b0001;
Syn_Out=0;
 SE0=0;
end
end
4'b0001 :
begin if(Sync_Detector_Data_In)
begin
state=4'b0000;
Syn_Out=0;
end
else
begin
    state=4'b0010;
    Syn_Out=0;
end
end
4'b0010 :
begin if(Sync_Detector_Data_In)
begin
state=4'b0000;
Syn_Out=0;
end
else
begin
    state=4'b0011;
    Syn_Out=0;
end
end
4'b0011 :
begin if(Sync_Detector_Data_In)
begin
state=4'b0000;
Syn_Out=0;
end
else
begin
    state=4'b0100;
    Syn_Out=0;
end
end
4'b0100 :
begin if(Sync_Detector_Data_In)
begin
state=4'b0000;
Syn_Out=0;
end
else
begin
    state=4'b0101;
    Syn_Out=0;
end
end
4'b0101 :
begin if(Sync_Detector_Data_In)
begin
state=4'b0000;
Syn_Out=0;
end
else
begin
    state=4'b0110;
    Syn_Out=0;
end
end
4'b0110 :
begin if(Sync_Detector_Data_In ==0)
begin
state=4'b0000;
Syn_Out=0;
end
else
begin
    state=4'b0111;
    Syn_Out=0;
end
end
4'b0111 :
begin if(Sync_Detector_Data_In==0)
begin
state=4'b0000;
Syn_Out=0;
end
else
begin
    state=4'b1000;
    Syn_Out=1;
end
end
4'b1000:
begin
    if(Diff==0)
    begin
        state = 4'b1001;
    end
end
4'b1001:
begin
    if(Diff==0)
    begin
        state = 4'b1010;
    end
end
4'b1010:
begin
    if(Diff==1'b1 && Sync_Detector_Data_In == 1'b1)
    begin
        state = 4'b0000;
        SE0 = 1'b1;
        Syn_Out =1'b0;
    end
    else
    begin
        state =4'b1000;
    end
end
endcase
end
end
endmodule
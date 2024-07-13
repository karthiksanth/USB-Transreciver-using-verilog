`include "module/Sync_Detector.v"
`include "module/Bit_Stuff_Error.v"
module Receiver_State_Machine(Data,Error,D_Sync,Tx_Ready,Active,Data_In,Diff,Clk);
input Tx_Ready,Active,Data_In,Diff,Clk;
output reg Data; output Error,D_Sync;
wire EOP;
wire Sync_Detector_Clk,Bit_Stuff_Error_Clk;
assign Sync_Detector_Clk = Sync && Clk;
assign Bit_Stuff_Error_Clk = Data & Clk;
reg Reset,Sync;
Sync_Detector Sync_Detector_instant(.Syn_Out(D_Sync),.SE0(EOP),.Reset(Reset),.Sync_Detector_Data_In(Data_In),.Diff(Diff),.Sync_Detector_Clk(Sync_Detector_Clk));
Bit_Stuff_Error Bit_Stuff_Error_instant(.Bit_Stuff_Error_Flag(Error),.Bit_Stuff_Data_In(Data_In),.Bit_Stuff_Clk(Bit_Stuff_Error_Clk),.Bit_Stuff_Reset(Reset));
parameter R_wait = 3'b000;
parameter R_Sync = 3'b001;
parameter R_Data = 3'b010;
parameter R_EOP =  3'b011;
parameter R_Error = 3'b100;
reg [2:0]state;

always @(posedge Active)
begin
     state = R_wait;
     Sync = 1'b0;
     Data = 1'b0;
     Reset =1;
end
always @(posedge Clk)
begin
    case(state)
    R_wait:
            begin
                if(Tx_Ready==0)
                     begin
                        state = R_Sync;
                        Sync = 1'b1;
                        Reset=1'b0;
                     end
                
            end
    R_Sync:
            begin
                if(D_Sync==1)
                begin
                    state = R_Data;
                    Data = 1'b1;
                    Sync = 1'b0;
                end
            end
     R_Data:
            begin
                if(Error)
                begin
                    state=R_Error;
                    Reset = 1;
                    Sync = 1'b0;
                    Data = 1'b0;
                end
                else
                begin
                    if(EOP)
                    begin
                        state = R_EOP;
                    end
                end
            end
    R_Error:
            begin
                Reset = 0;
                state = R_wait;
            end
    R_EOP:
             begin
                $display("End Of Packet");
                state = R_wait;
             end
    endcase
   
end
endmodule

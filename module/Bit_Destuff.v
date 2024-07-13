module Bit_Unstuffer(Bit_Unstuffer_Data_Out,Bit_Unstuffer_Flag,Bit_Unstuffer_Data_In,Bit_Unstuffer_Clk);
output reg Bit_Unstuffer_Data_Out,Bit_Unstuffer_Flag;
input Bit_Unstuffer_Data_In,Bit_Unstuffer_Clk;
reg [2:0] Bit_Unstuffer_Counter;
integer Flag=0;
initial
begin
Bit_Unstuffer_Flag =0;
Bit_Unstuffer_Counter=0;
end
always @(posedge Bit_Unstuffer_Clk)
begin
    if(Flag==0)
    begin
     if(Bit_Unstuffer_Data_In==1'b1)
       begin
        Bit_Unstuffer_Flag =1'b0;
         Bit_Unstuffer_Counter = Bit_Unstuffer_Counter+1;
          if(Bit_Unstuffer_Counter == 6)
          begin
            Flag =1'b1;
          end
          else
          Bit_Unstuffer_Data_Out=Bit_Unstuffer_Data_In;
       end
         else
      begin
          Bit_Unstuffer_Counter =0;
          Bit_Unstuffer_Data_Out = Bit_Unstuffer_Data_In;
     end
    end
      else
          begin
            Bit_Unstuffer_Flag =1'b1;
          Bit_Unstuffer_Data_Out =1'bz;
          Flag=0;
          Bit_Unstuffer_Counter =0;
          end
end
endmodule
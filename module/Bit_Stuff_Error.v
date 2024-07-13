module Bit_Stuff_Error(Bit_Stuff_Error_Flag,
                       Bit_Stuff_Data_In,
                       Bit_Stuff_Clk,
                       Bit_Stuff_Reset);
input Bit_Stuff_Data_In,Bit_Stuff_Clk,Bit_Stuff_Reset;
output Bit_Stuff_Error_Flag;
reg [2:0]Bit_Stuff_Count;
// always @(posedge Bit_Stuff_Reset)

always @(posedge Bit_Stuff_Clk)
begin
   if(Bit_Stuff_Reset)
   Bit_Stuff_Count = 0;
   else
   begin
   if(Bit_Stuff_Data_In==1  )
   Bit_Stuff_Count++;
   else
   Bit_Stuff_Count =0;
   end
end
assign Bit_Stuff_Error_Flag = &Bit_Stuff_Count;
endmodule
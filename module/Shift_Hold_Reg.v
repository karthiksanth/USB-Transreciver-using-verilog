module ShiftRegister_PIPO(Clk,Pi,Po);
input Clk;
input [7:0]Pi;
output reg [7:0]Po;
always @(posedge Clk)
begin
Po = Pi;
end
endmodule
module ShiftRegister_SIPO(clk,si,po,valid,sel);
input clk,si,sel;
output [7:0] po;
output valid;
reg [7:0] tmp;
reg[3:0] i;
always @(posedge sel)
begin
i=4'b1111;
tmp =0;
end
always @(posedge clk)
begin
   if(i == 4'b1000)
      i = 4'b0000;
       if(sel)
       begin
         tmp = tmp>>1;
         tmp[7]= si;
         i = i+1;           
         
        end
    
end
assign valid = i[3];
  assign po = tmp;
endmodule
module shift_and_hold_reg(shift_and_hold_reg_Data_Out,valid_bit,shift_and_hold_reg_Clk,shift_and_hold_reg_Data_In,select_pin);
input shift_and_hold_reg_Clk,shift_and_hold_reg_Data_In,select_pin;
output [7:0]shift_and_hold_reg_Data_Out;
output valid_bit; wire valid; wire [7:0]inter_data;
assign valid_bit =valid;
ShiftRegister_SIPO rx_shift (.clk(shift_and_hold_reg_Clk),.si(shift_and_hold_reg_Data_In),.po(inter_data),.valid(valid),.sel(select_pin));
ShiftRegister_PIPO rx_hold (.Clk(valid),.Pi(inter_data),.Po(shift_and_hold_reg_Data_Out));
endmodule
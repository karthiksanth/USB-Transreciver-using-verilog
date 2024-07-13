module Nazi_Decoder(Nazi_Decoder_Data_In,Nazi_Decoder_Clk, Nazi_Decoder_Data_Out);
input Nazi_Decoder_Data_In;
input wire Nazi_Decoder_Clk;
output reg Nazi_Decoder_Data_Out;
initial
Nazi_Decoder_Data_Out=0;
always @(posedge Nazi_Decoder_Clk) 
begin
case (Nazi_Decoder_Data_In == Nazi_Decoder_Data_Out)
   1'b0 : Nazi_Decoder_Data_Out=1'b0;
   1'b1 : Nazi_Decoder_Data_Out=1'b1;
endcase
end
endmodule

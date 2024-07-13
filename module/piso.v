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
Serial_Out<=tmp[3];
tmp<={tmp[6:0],1'b0};
end
end
endmodule

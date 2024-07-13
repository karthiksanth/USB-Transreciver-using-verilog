module nazi(data_in,clk, data_out);
input data_in;
input wire clk;
output reg data_out;
initial
data_out=0;
always @(posedge clk) 
begin
case (data_in)
   1'b0 : data_out=~data_out;
   1'b1 : data_out=data_out;
endcase
end
endmodule

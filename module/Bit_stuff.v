`timescale 1ns/1ns
module Bit_Stuff(output reg Bit_Stuff_Data_Out,output reg Bit_Stuff_Flag,input Bit_Stuff_Data_In,input Bit_Stuff_Clk);
integer Bit_Stuff_Counter=0;
initial
Bit_Stuff_Flag =0;
always @(posedge Bit_Stuff_Clk)
begin
    if(Bit_Stuff_Flag==0)
    begin
     if(Bit_Stuff_Data_In==1'b1)
       begin
         Bit_Stuff_Counter<=Bit_Stuff_Counter+1;
          if(Bit_Stuff_Counter == 5)
          begin
            Bit_Stuff_Flag =1'b1;
            end
          else
          Bit_Stuff_Data_Out<=Bit_Stuff_Data_In;
       end
         else
      begin
          Bit_Stuff_Counter <=0;
          Bit_Stuff_Data_Out <= Bit_Stuff_Data_In;
     end
end
else
begin
Bit_Stuff_Data_Out =1'b0;
Bit_Stuff_Flag=0;
end
end
endmodule

// module test();
// reg Bit_Stuff_Data_In,Bit_Stuff_Clk;
// wire  Bit_Stuff_Data_Out,Bit_Stuff_Flag;
// bitstiff dvt(.Bit_Stuff_Data_In(Bit_Stuff_Data_In),.Bit_Stuff_Clk(Bit_Stuff_Clk),.Bit_Stuff_Data_Out(Bit_Stuff_Data_Out),.Bit_Stuff_Flag(Bit_Stuff_Flag));
// reg a,b;
// reg [16:0]arr; 
// always #10 Bit_Stuff_Clk = ~Bit_Stuff_Clk;
// initial
// begin
//     a=1'b0;
// b= 1'b1;
// arr={ {4{a}}, {1{b}},{1{a}},{7{b}},a,b,a,b  };
//     $dumpfile("bit_tb.vcd");
// $dumpvars(0,test);
//     Bit_Stuff_Clk=0;
//     for (integer i=0; i<=16 ; i++  ) begin
//         #20
//         if(Bit_Stuff_Flag==0)
//         begin
//             Bit_Stuff_Data_In = arr[i];

//         end    
//         else
//         begin
//         Bit_Stuff_Data_In = 1'bz;
//         i--;
//         end
//     end
// $finish;
// end    
// endmodule
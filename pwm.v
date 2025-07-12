`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 22:29:19
// Design Name: 
// Module Name: pwm
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pwm(
input clk, rst, 
output reg dout
);
parameter period=100; 
integer count=0;
integer ton=0;
reg ncy=1'b0;

always@(posedge clk)
begin
            if(rst)
              begin
               dout<=0;
               count=0;
               ton=0;
              end
            else 
               begin
                if(count<=ton)
                  begin
                   count<=count+1;
                   dout<=1'b1;
                   ncy<=1'b0;
                  end
            else 
              if(count<period)
                begin
                 count<=count+1;
                 dout<=1'b0;
                 ncy<=1'b0;
                end  
              else
                begin
                 ncy<=1'b1;
                 count<=0; 
                end
             end 

end

always@(posedge clk)
begin
if(rst==1'b0)
    begin
       if(ncy==1'b1)
           begin
              if(count<period)
              begin
                 ton<=ton+5;
              end
              else
              begin
                 ton<=0;
              end
                 end
                 
              end
         end
         
reg [11:0]led;
integer i;
integer counttwo=0;         
always@(posedge dout)
for(i=0;i<11;i=i+1)
begin
counttwo<=counttwo+i;
led<=11'b10;

end
endmodule
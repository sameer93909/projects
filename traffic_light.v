`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.07.2025 21:58:26
// Design Name: 
// Module Name: traffic_light
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


module traffic_light(
    input clk,      
    input rst,      
    output reg [2:0]dout
);

   reg [7:0]count=0; 
   
   parameter idle=0;
   parameter red=1;
   parameter green=2;
   parameter yellow=3;
 reg [2:0]state=idle;
 always@(posedge clk)
 begin 
 if(rst)
 begin
 dout<=1'b0;
 state<=idle;
 end
 else
 begin 
               case(state)
               idle:begin
               dout<=red;
               state<=red;
               end
               
               red:
               begin
               
               if(count<=5)
                 begin
                  dout<=red;
                  count<=count+1;
                 end
               else
                 begin
                  
                  state<=green;
                  count<=0;
                 end  
               end
               
               green:
               begin
               
               if(count<=5)
                 begin
                  dout<=green;
                  count<=count+1;
                 end
               else
                 begin
                 
                  state<=yellow;
                  count<=0;
                 end  
               end
                 
               yellow:
               begin
               
               if(count<=5)
                 begin
                  
                  count<=count+1;
                 end
               else
                 begin
                 
                  count<=0;
                  state<=red;
                 end  
               end
               
              default:begin
              count<=0;
              dout<=1'b0;
              state<=idle;
              end
      endcase
   end
end  
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 02:27:51
// Design Name: 
// Module Name: assign1
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


module assign1( 
input clk,rst,din,
output reg dout
    );
 parameter   idle=0;
 parameter    s0=1;
 parameter   s1=2;
 parameter    s2=3;
 parameter   s3=4;
 parameter    s4=5;
 
 reg [2:0]state=idle,nstate=idle;
    
always@(posedge clk)
begin
    if(rst)
     begin
     state<=idle;
    end
    else
    begin
     state<=nstate;
    end
    end
    
always@(*)
begin
case(state)
idle:begin    
 dout=1'b0;
 nstate=s0;
 end   
    
 s0:begin
 dout=1'b0;
 if(din)
 begin
 nstate=s1;
 end 
 else
 begin
 nstate=s0;
 end
 end   
    
 s1:begin
 dout=1'b0;
 if(din)
 begin
 nstate=s1;
 end 
 else
 begin
 nstate=s2;
 end
 end   
    
 s2:begin
 dout=1'b0;
 if(din)
 begin
 nstate=s1;
 end 
 else
 begin
 nstate=s3;
 end
 end   
    
 s3:begin
 dout=1'b0;
 if(din)
 begin
 nstate=s4;
 end 
 else
 begin
 nstate=s0;
 end
 end   
    
 s4:begin
 dout=1'b1;
 if(din)
 begin
 nstate=s1;
 end 
 else
 begin
 nstate=s0;
 end
 end   
    
  default:begin
  nstate=idle;
  dout=1'b0;
  end  
    
    
   endcase 
 end   
endmodule

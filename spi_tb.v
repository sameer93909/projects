`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 18:17:31
// Design Name: 
// Module Name: spi_tb
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


module spi_tb(

    );
    reg clk=0,start=0;
    reg [7:0]din=0;
    wire mosi,cs,sclk,done;
    
 spi dut(clk,start,din,mosi,cs,sclk,done);   
    
  always #5 clk=~clk;
  
  initial begin
    
  start=1'b1;
 
  din=$urandom();
  @(posedge sclk);
  end  
    
   initial begin
   #300
   $finish;
   end 
    
    
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2025 15:39:30
// Design Name: 
// Module Name: bs41
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


module bs41(
    input w0,w1,w2,w3,
    input [1:0]sel,
    output   y
    );

assign y = (sel == 2'b00) ? w3 :
           (sel == 2'b01) ? w2 :
           (sel == 2'b10) ? w1 :
                            w0 ;
    
endmodule

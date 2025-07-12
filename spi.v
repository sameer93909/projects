`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.07.2025 17:02:04
// Design Name: 
// Module Name: spi
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


module spi(
input clk,start,
input [7:0]din,
output reg mosi,cs,sclk=0,done
    );
    
integer count=0;
always@(posedge clk)
begin
if(count<10)
count<=count+1;
else
count<=0;
sclk<=~sclk;
end  


/////////////////////////logic
parameter idle=0,start_tx=1,send_data=2,end_tx=3;
reg [7:0]temp=0;
reg [2:0]state=idle;
reg [7:0]bitcount=0;    
    
always@(posedge sclk)
begin
case(state)
                    idle:begin
                    cs<=1'b1;
                    mosi<=1'b0;
                    done<=1'b0;
                  
                    if(start)
                    state<=start_tx;
                    else
                    state<=idle;
                    end
                    
                    start_tx:begin
                    cs<=1'b0;
                    temp<=din;
                    mosi<=0;
                    state<=send_data;
                    end
                    
                    send_data:begin
                    
                    if(bitcount<=7)
                    begin
                    bitcount<=bitcount+1;
                    mosi<=temp[bitcount];
                    state<=send_data;
                    end
                    else
                    begin
                    bitcount<=1'b0;
                    mosi<=1'b0;
                    state<=end_tx;
                    end
                    end
                    
                    end_tx:begin
                    cs<=1'b1;
                    done<=1'b1;
                    end
                    
              default:state<=idle;      

endcase
end    
endmodule

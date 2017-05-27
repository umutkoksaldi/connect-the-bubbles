`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:39:00 12/21/2015 
// Design Name: 
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top(CLK, led, en, oe, SH_CP, ST_CP, reset, DS, CAT, turn, turnswitch, an, cat, dp, res);

input CLK;
input [5:0] led;
input en;
input res;
input turnswitch;
output [3:0] an;
output [6:0] cat;
output dp;

wire [63:0] red;
wire [63:0] blue;

wire [3:0] p1Score;
	
output oe;
output SH_CP; 
output ST_CP;
output reset;
output DS;
output [7:0] CAT;
output turn;


GameController ctrl(CLK, red, blue, led, en, p1Score, turn, turnswitch, res);
RGBDotMatrixModule rgb(CLK, red, blue, oe, SH_CP, ST_CP, reset, DS,CAT);
SevenSegmentDisplayController ssd(CLK, 0, 4'b1111, 4'b0001, 4'b0010, 4'b1111, p1Score, an,cat, dp);


endmodule

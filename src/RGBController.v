`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:51:36 12/22/2015 
// Design Name: 
// Module Name:    RGBController 
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
module RGBController(CLK, column, red, blue, state);

input CLK;
input [7:0] column;

reg [7:0] col = 0;

reg [2:0] ins = 0;
input [2:0] state = 0;

always @(column[0])
begin
	if( !col[7]) begin
		state = 7; column [7] = 1;end
	if( !col[6])
		state = 6;
	if( !col[5])
		state = 5;
	if( !col[4])
		state = 4;
	if( !col[3])
		state = 3;
	if( !col[2])
		state = 2;
	if( !col[1])
		state = 1;
	if( !col[0])
		state = 0;
end


endmodule


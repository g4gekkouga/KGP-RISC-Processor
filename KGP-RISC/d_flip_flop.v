`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:23 10/28/2019 
// Design Name: 
// Module Name:    d_flip_flop 
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
module d_flip_flop(input wire clk, input wire rst, input wire in, output reg out);
	always @(posedge clk or posedge rst)
	begin
		if(rst)
			out <= 0;
		else
			out <= in;
	end


endmodule

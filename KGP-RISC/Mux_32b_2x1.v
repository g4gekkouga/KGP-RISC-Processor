`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:33:17 11/06/2019 
// Design Name: 
// Module Name:    Mux_32b_2x1 
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
module Mux_32b_2x1(input wire [31:0] a, input wire [31:0] b, input wire select, output reg[31:0] out);
	always @(*)
	begin 
		if(select)
			out = b;
		else out = a;
	end
endmodule

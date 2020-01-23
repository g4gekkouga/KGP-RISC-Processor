`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:54:53 11/04/2019 
// Design Name: 
// Module Name:    load_store_memory 
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
module l_s_memory( input wire clk, input wire rst, input wire [9:0] addr, input wire [31:0] data_in, input wire MemRead, MemWrite, 
	output wire [31:0] data_out);
	wire ena;
	wire [9:0] address;
	assign ena = (MemRead)? 1'b1 : MemWrite;
	assign address = (ena)? addr : 10'd0;
	blk_mem_gen_v7_3_memory memory(.clka(clk), .addra(address), .douta(data_out), .dina(data_in), .wea(MemWrite));
endmodule

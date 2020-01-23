`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:47:45 10/16/2019 
// Design Name: 
// Module Name:    instruction_fetch 
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
module instruction_fetch(input wire [31:0] pc,output wire [31:0] instruction,input wire clk,input wire rst);
	wire [3:0] address;
	assign address = pc[5:2];
	blk_mem_gen_v7_3 instructions(.clka(clk),  .addra(address), .douta(instruction), .wea(1'b0));
	//.clka(clk), .addra(addr), .douta(dout), .dina(16'b0), .wea(1'b0)
endmodule

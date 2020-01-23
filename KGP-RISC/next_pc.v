`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:04 10/23/2019 
// Design Name: 
// Module Name:    next_pc 
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
module next_pc(input wire clk, input wire rst, input wire [25:0] L, input wire branch, input wire reg_en, input wire [31:0] register, output reg [31:0] pc);
	
	wire [31:0] pc_new, pc_jump_off, pc_jump, pc_next;
	
	initial begin
	pc <= 32'd0;
	end
	
	always @(posedge clk or posedge rst) begin
		if (rst) pc <= 32'd0;
		else pc <= pc_new;
	end
	
	assign pc_next = pc + 32'd4;
	assign pc_jump_off = pc + 32'd4 + {{6{L[25]}}, L};
	assign pc_jump = (reg_en)? register : pc_jump_off;
	assign pc_new = (branch)? pc_jump : pc_next;
	
endmodule

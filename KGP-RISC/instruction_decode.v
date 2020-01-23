`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:12:33 10/14/2019 
// Design Name: 
// Module Name:    instruction_decode 
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
module instruction_decode(input wire[31:0] instruction, output wire[1:0] opcode, output wire[3:0] fcode, output wire[4:0] rs, output wire[4:0] rt, output wire[15:0] imm, output wire[15:0] sh, output wire[25:0] j);
		assign opcode = instruction[31:30];
		assign fcode = instruction[29:26];
		assign rs = instruction[25:21];
		assign rt = instruction[20:16];
		assign imm = instruction[15:0];
		assign sh = instruction[15:0];
		assign j = instruction[25:0];
endmodule

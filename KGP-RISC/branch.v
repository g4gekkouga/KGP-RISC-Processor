`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:26:54 10/28/2019 
// Design Name: 
// Module Name:    branch 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Createdf
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module branch(input wire clk, input wire rst, input wire[1:0] opcode, input wire[3:0] fcode, input wire[25:0] offset_in, input wire[31:0] reg_val, input wire z_flag, input wire c_flag, input wire s_flag, input wire o_flag, output reg[25:0] offset_out, output reg branch );
	wire z_flag_c, c_flag_c, o_flag_c, s_flag_c;
	
	d_flip_flop z_flag_ff(clk, rst, z_flag, z_flag_c),
				 c_flag_ff(clk, rst, c_flag, c_flag_c),
				 s_flag_ff(clk, rst, s_flag, s_flag_c),
				 o_flag_ff(clk, rst, o_flag, o_flag_c);
	
	always @(opcode or fcode or reg_val or offset_in or z_flag_c or c_flag_c or s_flag_c or o_flag_c or rst)
	begin
		
		if (rst) begin
			offset_out = 0;
			branch = 0;
		end
		
		else begin
			
			if (opcode == 2'b11) begin
		
				branch = 1;
			
				case(fcode)
					
					4'b0010: begin // unconditional branch
									offset_out = offset_in;
								end
					4'b0001: begin // branch to register
									offset_out = reg_val[25:0];
								end
					4'b0011: begin // branch if zero
									if (z_flag_c) offset_out = offset_in;
									else begin
										branch = 0;
										offset_out = 0;
									end
								end
					4'b0100: begin // branch if not zero
									if (!z_flag_c) offset_out = offset_in;
									else begin
										branch = 0;
										offset_out = 0;
									end
								end
					4'b0101: begin // branch if carry
									if (c_flag_c) offset_out = offset_in;
									else begin
										branch = 0;
										offset_out = 0;
									end
								end
					4'b0110: begin // branch if not carry
									if (!c_flag_c) offset_out = offset_in;
									else begin
										branch = 0;
										offset_out = 0;
									end
								end
					4'b0111: begin // branch if sign
									if (s_flag_c) offset_out = offset_in;
									else begin
										branch = 0;
										offset_out = 0;
									end
								end
					4'b1000: begin // branch if not sign
									if (!s_flag_c) offset_out = offset_in;
									else begin
										branch = 0;
										offset_out = 0;
									end
								end
					4'b1001: begin // branch if overflow
									if (o_flag_c) offset_out = offset_in;
									else begin
										branch = 0;
										offset_out = 0;
									end
								end
					4'b1010: begin // branch if not overflow
									if (!o_flag_c) offset_out = offset_in;
									else begin
										branch = 0;
										offset_out = 0;
									end
								end
					4'b1011: begin // call function
									offset_out = offset_in;
								end
					4'b0000: begin // return
									offset_out = reg_val[25:0];
								end
					default: begin
									branch = 0;
									offset_out = 0;
								end
					endcase
			
			end
			
			else begin 
			
				offset_out = 0;
				branch = 0;
			
			end
		
		end
	end
endmodule

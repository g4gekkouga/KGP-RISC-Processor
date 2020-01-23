`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:35:37 11/06/2019 
// Design Name: 
// Module Name:    top_module 
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
module top_module( input wire clk, input wire rst,output wire z_out, output wire [31:0] pc_out, instruction_out );//Variables declared as output only for trial means
	wire [31:0] pc;
	wire [31:0] instruction;
	wire [31:0] alu_result, alu_result_mult;
	wire[25:0] jump_offset;
	assign pc_out = pc; 
	assign instruction_out = instruction;
	wire [1:0] opcode; 
	wire [4:0] reg_addr_1, reg_addr_2; 
	wire [3:0] fcode; 
	wire [15:0] imm, shift_amount; 
	wire [25:0] offset; 

	wire [5:0] alu_control; // The control signal to the ALU
	wire Branch, regWrite, MemWrite,MemRead,const_src,reg_data,reg_to_pc,regWrite_select; // The control signal form the control unit
	wire zero_flag, carry_flag, sign_flag, overflow_flag; // The flags from the ALU
	assign z_out = zero_flag;
	// fetch the instruction from generated BRAM
	instruction_fetch IF(.pc(pc),.instruction(instruction),.clk(clk),.rst(rst)); // THe instruction fetch module contains the bram instance to read the instructions
	
	// decoding the fetched instruction
	instruction_decode ID(.instruction(instruction),.opcode(opcode), .rs(reg_addr_1),.rt(reg_addr_2),.sh(shift_amount),
									.fcode(fcode),.imm(imm),.j(offset)); // The instruction decoder to break down the instructions into smaller opcodes
	// access the control unit
	control_unit CU (.opcode(opcode),.fcode(fcode),.clk(clk),.rst(rst),.alu_control(alu_control),
					 .branch(Branch),.regWrite(regWrite),.memRead(MemRead),.memWrite(MemWrite),.regWriteSelect(regWrite_select),
					 .const_src(const_src),.regData(reg_data),.reg2PC(reg_to_pc));
	// The control unit module
	
	wire branch_success; //A wire set as a flag in the branch logic module telling the program counter whether to branch or not.
	
	// detecting the branch part
	branch BL(.clk(clk),.rst(rst),.opcode(opcode),.fcode(fcode),.offset_in(offset),.reg_val(alu_result),.z_flag(zero_flag),
				  .c_flag(carry_flag),.o_flag(overflow_flag),.s_flag(sign_flag),.branch(branch_success),.offset_out(jump_offset)); // The branch logic module which essentialssy defines the offset
					// and sets the branch_success flag.
	//	next_pc PCN(.clk(clk),.rst(rst),.L(jump_offset),.branch(branch_success),.reg_en(1'b0),.register(32'd0),.pc(pc)); // The program counter module
	data_path DP (.clk(clk),.rst(rst),.regWriteEnable(regWrite),.regAddr_1(reg_addr_1),.regAddr_2(reg_addr_2),.shift_amount(shift_amount), 
					 .npc(pc),.reg_to_pc(reg_to_pc), .regWrite_select(regWrite_select),
					 .MemRead(MemRead),.MemWrite(MemWrite),.alu_control(alu_control),.const_src(const_src),.reg_data(reg_data),
					 .imm(imm),.alu_result(alu_result),.alu_result_mult(alu_result_mult),.zero_flag(zero_flag),.carry_flag(carry_flag),
					 .sign_flag(sign_flag),.overflow_flag(overflow_flag)); 
	//Almost the entire data path is declared in this one module
	
	// get next pc instruction address
	PC_next PCN(.clk(clk),.rst(rst),.offset(jump_offset),.branch(branch_success),.pc(pc));

	
endmodule


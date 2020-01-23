`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:04 11/06/2019 
// Design Name: 
// Module Name:    data_path 
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
module data_path( input wire clk, input wire rst, input wire regWriteEnable, input wire[4:0] regAddr_1, input wire[4:0] regAddr_2,  input wire [15:0] shift_amount,
					  input wire [31:0] npc, input wire reg_to_pc, input wire regWrite_select,
					  input wire MemRead, input wire MemWrite, input wire [5:0] alu_control, input wire const_src, input wire reg_data,
					  input wire [15:0] imm, output wire [31:0] alu_result, alu_result_mult, output wire zero_flag, output wire carry_flag,
					  output wire sign_flag, output wire overflow_flag);

	wire[31:0] memDataOut;// the output from the Data memory
	wire[31:0] alu_result_temp, alu_result_temp_mult; // a temporary input to the muxs and is the alu's result
	wire[31:0] regWriteData, regReadData_1, regReadData_2; // Register Bank and Data Memory data Buses
	wire[31:0] regWriteData_temp;   // output of mux from alu/ data memory -> reg bank

		l_s_memory l_s_mem(.clk(clk), .rst(rst),.addr(alu_result_temp[9:0]),.data_in(regReadData_2),.MemRead(MemRead),
						.MemWrite(MemWrite),.data_out(memDataOut)); // blockran  memory for store and load word

	Mux_32b_2x1 reg_input(.a(memDataOut),.b(alu_result_temp),.select(reg_data),.out(regWriteData_temp));
	Mux_32b_2x1 regBank_pc_input(.a(regWriteData_temp),.b(npc),.select(reg_to_pc),.out(regWriteData));  // Muxes for regbank access

	wire [4:0] reg_Addr_1_final; // the fianl input to the register bank and the output of a MUX

	Mux_5b_2x1 regBank_addr_input (.a(regAddr_1),.b(5'b11111),.select(reg_to_pc),.out(reg_Addr_1_final)); // for accessing ra register at 32 

	wire [4:0] regWriteAddr;
	Mux_5b_2x1 regWriteAddr_select (.a(reg_Addr_1_final),.b(regAddr_2),.select(regWrite_select),.out(regWriteAddr));

// access the registers
	register_bank Reg_Bank(.clk(clk),.rst(rst),.regWriteEnable(regWriteEnable),.regWriteData(regWriteData), .regAddr_write(regWriteAddr),
					 .regAddr_1(reg_Addr_1_final),.regAddr_2(regAddr_2),.regReadData_1(regReadData_1),.regReadData_2(regReadData_2), .flag(1'b1));
	
	
	wire [31:0] alu_input_3, alu_const_input;

	//MUXes controlling the ALU's datapath
	Mux_32b_2x1 alu_input_imm (.a({{16{imm[15]}},imm}),.b({16'b0,shift_amount}),.select(const_src),.out(alu_input_3)); 

	alu ALU(.a(regReadData_1),.b(regReadData_2),.imm(alu_input_3[15:0]),.control(alu_control),.res(alu_result_temp),.res_mult(alu_result_temp_mult),.z_flag(zero_flag),
				.c_flag(carry_flag),.s_flag(sign_flag),.o_flag(overflow_flag));

	// Assigning the ouput of the MUX to the ALU result 
	assign alu_result = alu_result_temp;
	assign alu_result_mult = alu_result_temp_mult;	

endmodule


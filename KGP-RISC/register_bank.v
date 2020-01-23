`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:55 10/16/2019 
// Design Name: 
// Module Name:    register_bank 
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
module register_bank(input wire clk,input wire rst,input wire regWriteEnable, input wire [4:0] regAddr_write, input wire [31:0] regWriteData, input wire [4:0] regAddr_1, output wire [31:0] regReadData_1,input wire [4:0] regAddr_2, output wire [31:0] regReadData_2, input wire flag);
	
	reg [31:0] regArray [31:0];
	integer i; 

	always @ (posedge clk or posedge rst )
	begin
		if(rst)
		begin
			for(i=0;i<32;i=i+1)//Initialising all the registers to zero upon reset
				regArray[i] <= 32'd0;
		end
		else
		begin
			if(regWriteEnable) 
			begin
				regArray[regAddr_write] <= regWriteData;
			end
		end
	end
	
	assign regReadData_1 = regArray[regAddr_1]; // data output
	assign regReadData_2 = flag?regArray[regAddr_2]:32'd0; //data output
	
endmodule

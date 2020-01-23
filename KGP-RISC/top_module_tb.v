`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:55:24 11/06/2019
// Design Name:   top_module
// Module Name:   C:/Users/MY/Desktop/Assgn10 (1)/Assgn10/top_module_tb.v
// Project Name:  Assgn10
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_module
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module top_module_tb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire z_out;
	wire [31:0] pc_out;
	wire [31:0] instruction_out;

	// Instantiate the Unit Under Test (UUT)
	top_module uut (
		.clk(clk), 
		.rst(rst), 
		.z_out(z_out), 
		.pc_out(pc_out), 
		.instruction_out(instruction_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		
		#20;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#1000;
        
		// Add stimulus here

	end
	
	always begin
	#10 clk = ~clk;
	end
      
endmodule


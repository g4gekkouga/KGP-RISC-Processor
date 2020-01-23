`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:31:19 10/28/2019 
// Design Name: 
// Module Name:    full_adder 
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
module full_adder(
    input a,b,cin,
    output sum,cout
    );
	 
	 wire w1,w2,w3;
	 
	 assign w1 = a ^ b;
	 assign sum = w1 ^ cin;
	 
	 assign w2 = w1 & cin;
	 assign w3 = a & b;
	 assign cout = w2 | w3; 

	 
endmodule


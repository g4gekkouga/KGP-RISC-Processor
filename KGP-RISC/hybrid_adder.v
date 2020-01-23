`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:43 10/28/2019 
// Design Name: 
// Module Name:    hybrid_adder 
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
`timescale 1ns / 1ps

/*
Assignment no : 6
Problem : Hybrid Adder 
Probelm No : 2
Semester : 5
Group No : 52
Member 1 : P Amshumaan Varma
Member 2 : K Snehal Reddy
*/

module hybrid_adder(
	input [31:0] a,
	input [31:0] b,
	input cin,
	output [31:0] s,
	output cout
    );
	 
	wire [3:0] w1, w2, w3, w4, w5, w6, w7, w8, w1_, w2_, w3_, w4_, w5_, w6_, w7_, w8_;
	assign w1 = a[3:0];
	assign w2 = a[7:4];
	assign w3 = a[11:8];
	assign w4 = a[15:12];
	assign w5 = a[19:16];
	assign w6 = a[23:20];
	assign w7 = a[27:24];
	assign w8 = a[31:28];
	assign w1_ = b[3:0];
	assign w2_ = b[7:4];
	assign w3_ = b[11:8];
	assign w4_ = b[15:12];
	assign w5_ = b[19:16];
	assign w6_ = b[23:20];
	assign w7_ = b[27:24];
	assign w8_ = b[31:28];
	
	wire t1, t2, t3, t4, t5, t6, t7;
	
	adder cla_1(w1, w1_, cin, s[3:0], t1);
	adder cla_2(w2, w2_, t1, s[7:4], t2);
	adder cla_3(w3, w3_, t2, s[11:8], t3);
	adder cla_4(w4, w4_, t3, s[15:12], t4);
	adder cla_5(w5, w5_, t4, s[19:16], t5);
	adder cla_6(w6, w6_, t5, s[23:20], t6);
	adder cla_7(w7, w7_, t6, s[27:24], t7);
	adder cla_8(w8, w8_, t7, s[31:28], cout);
	
	
	 


endmodule


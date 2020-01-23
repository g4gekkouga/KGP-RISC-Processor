`timescale 1ns / 1ps

module barrel_shifter(
	input [31:0] in, input [4:0] s, input dir, 
	output [31:0] out
    );
	 
	wire[31:0] a, b, c, d, e;
	
	assign a = s[0] ? {in[30:0], 1'd0} : in;
	assign b = s[1] ? {a[29:0], 2'd0} : a;
	assign c = s[2] ? {b[27:0], 4'd0} : b;
	assign d = s[3] ? {c[23:0], 8'd0} : c;
	assign e = s[4] ? {d[15:0], 16'd0} : d;
	
	wire[31:0] a1, b1, c1, d1, e1;
	assign a1 = s[0] ? {1'd0,in[31:1]} : in;
	assign b1 = s[1] ? {2'd0,a1[31:2]} : a1;
	assign c1 = s[2] ? {4'd0, b1[31:4]} : b1;
	assign d1 = s[3] ? {8'd0, c1[31:8]} : c1;
	assign e1 = s[4] ? {16'd0, d1[31:16]} : d1;
	
	assign out = dir ? e1 : e;

endmodule

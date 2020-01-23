`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:05 10/23/2019 
// Design Name: 
// Module Name:    alu 
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
module alu(input wire[31:0] a, input wire[31:0] b, input wire[15:0] imm, input wire[5:0] control, output reg[31:0] res, output reg[31:0] res_mult, output reg c_flag, output reg z_flag, output reg s_flag, output reg o_flag);
	wire [31:0] multu_l, multu_u, mult_l, mult_u, addi;
	wire [31:0] addn, shift, shif_i;
	wire cn, ci;
	
//	multiplier_u m1(a, b, multu_l, multu_u);
//	multiplier m2(a, b, mult_l, mult_u);
	
//	hybrid_adder a1(a, b, 1'b0, addn, cn);
//	hybrid_adder a2(a, {16'd0,imm}, 1'b0, addi, ci);
	
//	barrel_shifter b1(a, b[4:0], control[0], shift);
//	barrel_shifter b2(a, imm[4:0], control[0], shift_i);
	
	
	always@(a or b or imm or control)
	begin
		c_flag = 0; //carry flag
		z_flag = 0; //zero flag
		s_flag = 0; //sign flag
		o_flag = 0; //overlfow flag
		res_mult = 32'd0;
		
		case(control)
			6'b010000: res = a & b;
			6'b010001: res = a ^ b;
			6'b010010: begin
							//c_flag = cn;
							//res = addn;
							{c_flag,res} = a+b;
						  end 
						  
			6'b010011: begin
						//res = multu_l;
						//	res_mult = multu_u;
						  end
			6'b010100: begin
						//	res = mult_l;
						//	res_mult = mult_u;
						  end
			6'b010101: res = ~b + 1;
			6'b010110: res = a>>b;
			6'b010111: res = a<<b;
			6'b011000: res = a>>>b;
			6'b100000: begin
					//		c_flag = ci;
					//		res = addi;
							{c_flag,res} = a+imm;
						  end
			6'b100001: res = ~imm + 1;
			6'b100010: res = a>>imm;
			6'b100011: res = a<<imm;
			6'b100100: res = a>>>imm; 
			6'b000000: res = a+imm;
			6'b110000: res = a;
			6'b110001: res = b;
			default: res = 32'd0;
		endcase
		if(res==32'd0) begin
			z_flag = 1; // zero flag
		end
		s_flag = res[31]; // sign flag
		o_flag = c_flag^(res[31]^(a[31]^b[31])); //overflow flag
	end
	
endmodule

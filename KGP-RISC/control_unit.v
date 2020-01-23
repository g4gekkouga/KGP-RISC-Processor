`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:59 11/04/2019 
// Design Name: 
// Module Name:    control_unit 
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
module control_unit(input wire clk, input wire rst, input wire[1:0] opcode, input wire[3:0] fcode, 
output reg[5:0] alu_control, 
output reg branch, regWrite, memWrite, const_src, memRead, regData, reg2PC, regWriteSelect );

always@(opcode or fcode or rst)
begin	
	if(rst)
	begin
		alu_control <= 0;
		branch <= 0;
		regWrite <= 0;
		memWrite <= 0;
		memRead <= 0;
		regData <= 0;
		reg2PC <= 0;
		regWriteSelect <= 0;
		const_src <= 0;
		
	end
	else begin
		case(opcode)
			2'd0: begin
						case(fcode)
							4'd0: begin
										alu_control <= 6'd0;
										branch <= 0;
										regWrite <= 1;
										memWrite <= 0;
										memRead <= 1;
										const_src <= 0;
										regData <= 0;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end
							4'd1: begin
										alu_control <= 6'd0;
										branch <= 0;
										regWrite <= 0;
										memWrite <= 1;
										memRead <= 0;
										const_src <= 0;
										regData <= 0;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end
							default: begin
										end
						endcase	
					end
			2'd1: begin
						case(fcode)
							4'd0: begin
										alu_control <= 6'b010000;
										branch <= 0;
										regWrite <= 1;
										memWrite <= 0;
										memRead <= 0;
										const_src <= 0;
										regData <= 1;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end
							4'd1: begin
										alu_control <= 6'd010001;
										branch <= 0;
										regWrite <= 1;
										memWrite <= 0;
										memRead <= 0;
										const_src <= 0;
										regData <= 1;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end
							4'd2: begin
										alu_control <= 6'd010010;
										branch <= 0;
										regWrite <= 1;
										memWrite <= 0;
										memRead <= 0;
										const_src <= 0;
										regData <= 1;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end
							4'd3: begin
										alu_control <= 6'd010011;
										branch <= 0;
										regWrite <= 1;
										memWrite <= 0;
										memRead <= 0;
										const_src <= 0;
										regData <= 1;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end
							4'd4: begin
										alu_control <= 6'd010100;
										branch <= 0;
										regWrite <= 1;
										memWrite <= 0;
										memRead <= 0;
										const_src <= 0;
										regData <= 1;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end
							4'd5: begin
										alu_control <= 6'd010101;
										branch <= 0;
										regWrite <= 1;
										memWrite <= 0;
										memRead <= 0;
										const_src <= 0;
										regData <= 1;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end
							4'd6: begin
										alu_control <= 6'd010110;
										branch <= 0;
										regWrite <= 1;
										memWrite <= 0;
										memRead <= 0;
										const_src <= 0;
										regData <= 1;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end
							4'd7: begin
										alu_control <= 6'd010111;
										branch <= 0;
										regWrite <= 1;
										memWrite <= 0;
										memRead <= 0;
										const_src <= 0;
										regData <= 1;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end
							4'd8: begin
										alu_control <= 6'd011000;
										branch <= 0;
										regWrite <= 1;
										memWrite <= 0;
										memRead <= 0;
										const_src <= 0;
										regData <= 1;
										reg2PC <= 0;
										regWriteSelect <= 0;	
									end	
							default: begin
										end
						endcase
					end
			2'd2: begin
						case(fcode)
							4'd0: begin
											alu_control <= 6'b100000;
											branch <= 0;
											regWrite <= 1;
											memWrite <= 0;
											const_src <= 0;
											memRead <= 0;
											regData <= 1;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd1: begin
											alu_control <= 6'b100001;
											branch <= 0;
											regWrite <= 1;
											memWrite <= 0;
											const_src <= 0;
											memRead <= 0;
											regData <= 1;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd2: begin
											alu_control <= 6'b100010;
											branch <= 0;
											regWrite <= 1;
											memWrite <= 0;
											const_src <= 1;
											memRead <= 0;
											regData <= 1;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd3: begin
											alu_control <= 6'b100011;
											branch <= 0;
											regWrite <= 1;
											memWrite <= 0;
											const_src <= 1;
											memRead <= 0;
											regData <= 1;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd4: begin
											alu_control <= 6'b100100;
											branch <= 0;
											regWrite <= 1;
											memWrite <= 0;
											const_src <= 1;
											memRead <= 0;
											regData <= 1;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							default: begin
										end
						endcase
					end
			2'd3: begin
						case(fcode)
							4'd0: begin
											alu_control <= 6'b110000;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											const_src <= 0;
											memRead <= 0;
											regData <= 0;
											reg2PC <= 1;
											regWriteSelect <= 0;	
										end
							4'd1: begin
											alu_control <= 6'b110001;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											const_src <= 0;
											memRead <= 0;
											regData <= 0;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd2: begin
											alu_control <= 6'b110010;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											const_src <= 0;
											memRead <= 0;
											regData <= 0;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd3: begin
											alu_control <= 6'b110011;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											memRead <= 0;
											const_src <= 0;
											regData <= 0;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd4: begin
											alu_control <= 6'b110100;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											memRead <= 0;
											const_src <= 0;
											regData <= 0;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd5: begin
											alu_control <= 6'b110101;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											memRead <= 0;
											const_src <= 0;
											regData <= 0;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd6: begin
											alu_control <= 6'b110110;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											memRead <= 0;
											const_src <= 0;
											regData <= 0;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd7: begin
											alu_control <= 6'b110111;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											memRead <= 0;
											const_src <= 0;
											regData <= 0;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd8: begin
											alu_control <= 6'b111000;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											memRead <= 0;
											const_src <= 0;
											regData <= 0;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd9: begin
											alu_control <= 6'b111001;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											memRead <= 0;
											const_src <= 0;
											regData <= 0;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd10: begin
											alu_control <= 6'b111010;
											branch <= 1;
											regWrite <= 0;
											memWrite <= 0;
											memRead <= 0;
											const_src <= 0;
											regData <= 0;
											reg2PC <= 0;
											regWriteSelect <= 0;	
										end
							4'd11: begin
											alu_control <= 6'b111011;
											branch <= 1;
											regWrite <= 1;
											memWrite <= 0;
											memRead <= 0;
											const_src <= 0;
											regData <= 0;
											reg2PC <= 1;
											regWriteSelect <= 0;	
										end
							default: begin
										end
						endcase
					end
			default: begin
						end
		endcase
	end
end

endmodule

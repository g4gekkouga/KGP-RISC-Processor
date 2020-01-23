`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:40:52 10/23/2019 
// Design Name: 
// Module Name:    multiplier 
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
module multiplier(input wire[31:0] a1, input wire[31:0] b1, output wire [31:0] y, output wire[31:0] z);

parameter width = 64;

wire [width-1:0] a, b, y1;

assign a = a[31] ? {32'b11111111111111111111111111111111,a1} : {32'd0,a1};
assign b = b[31] ? {32'b11111111111111111111111111111111,b1} : {32'd0,b1};


wire [width*width-1:0] partials;

genvar i;
assign partials[width-1 : 0] = a[0] ? b : 0;
generate for (i = 1; i < width; i = i+1) begin:gen
    assign partials[width*(i+1)-1 : width*i] = (a[i] ? b << i : 0) +
                                   partials[width*i-1 : width*(i-1)];
end endgenerate

assign y1 = partials[width*width-1 : width*(width-1)];

assign y = y1[31:0];
assign z = y1[63:32];

endmodule

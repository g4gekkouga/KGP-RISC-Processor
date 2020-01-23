`timescale 1ns / 1ps

module adder(
	input  [3:0]  i_add1,
   input  [3:0]  i_add2,
	input  cin,
   output [3:0] o_result,
	output cout
    );
     
  wire [4:0]    w_C;
  wire [3:0]    w_G, w_P, w_SUM;
   
  full_adder full_adder_bit_0
    ( 
      .a(i_add1[0]),
      .b(i_add2[0]),
      .cin(w_C[0]),
      .sum(w_SUM[0]),
      .cout()
      );
 
  full_adder full_adder_bit_1
    ( 
      .a(i_add1[1]),
      .b(i_add2[1]),
      .cin(w_C[1]),
      .sum(w_SUM[1]),
      .cout()
      );

  full_adder full_adder_bit_2
    ( 
      .a(i_add1[2]),
      .b(i_add2[2]),
      .cin(w_C[2]),
      .sum(w_SUM[2]),
      .cout()
      );
   
  full_adder full_adder_bit_3
    ( 
      .a(i_add1[3]),
      .b(i_add2[3]),
      .cin(w_C[3]),
      .sum(w_SUM[3]),
      .cout()
      );
   
  // Create the Generate (G) Terms:  Gi=Ai*Bi
  assign w_G[0] = i_add1[0] & i_add2[0];
  assign w_G[1] = i_add1[1] & i_add2[1];
  assign w_G[2] = i_add1[2] & i_add2[2];
  assign w_G[3] = i_add1[3] & i_add2[3];
 
  // Create the Propagate Terms: Pi=Ai+Bi
  assign w_P[0] = i_add1[0] | i_add2[0];
  assign w_P[1] = i_add1[1] | i_add2[1];
  assign w_P[2] = i_add1[2] | i_add2[2];
  assign w_P[3] = i_add1[3] | i_add2[3];
 
  // Create the Carry Terms:
  assign w_C[0] = cin; // no carry input
  assign w_C[1] = w_G[0] | (w_P[0] & w_C[0]);
  assign w_C[2] = w_G[1] | (w_P[1] & w_C[1]);
  assign w_C[3] = w_G[2] | (w_P[2] & w_C[2]);
  assign w_C[4] = w_G[3] | (w_P[3] & w_C[3]);
   
  assign o_result = w_SUM;
  assign cout = w_C[4];
 
endmodule // carry_lookahead_adder_4_bit

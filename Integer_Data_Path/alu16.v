`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: alu16.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: This 16-bit ALU will be used in the 301 "Integer Datapath" project
 * to perform various manipulations on 16-bit integers.
 * There are 4 "Op" inputs to perform up to 16 basic operations.
 * Currently, there are only 13 of the 16 operations used.
 *
 * The alu status flags represent the Y output being negative (N),
 * zero (Z), and a carry out (C).
 *
 *******************************************************************************/
module alu16 (R, S, Alu_Op, Y, N, Z, C);
   input  [15:0] R, S;
   input  [3:0] Alu_Op;
   output [15:0] Y;       reg [15:0] Y;
   output N, Z, C;        reg N, Z, C;
   
   always @( R or S or Alu_Op) begin
      case (Alu_Op)
         4'b0000: {C,Y} = {1'b0,S};      // pass S
         4'b0001: {C,Y} = {1'b0,R};      // pass R
         4'b0010: {C,Y} = S + 1;         // increment S
         4'b0011: {C,Y} = S - 1;         // decrement S
         4'b0100: {C,Y} = R + S;         // add
         4'b0101: {C,Y} = R - S;         // subtract
         4'b0110: begin                  // right shift S (logic)
                     C = S[0];
                     Y = S >> 1;
                  end
         4'b0111: begin                  // left shift S (logic)
                     C = S[15];
                     Y = S << 1;

                  end
         4'b1000: {C,Y} = {1'b0,R & S}; // logic and
         4'b1001: {C,Y} = {1'b0,R | S}; // logic or
         4'b1010: {C,Y} = {1'b0,R ^ S}; // logic xor
         4'b1011: {C,Y} = {1'b0,~S};    // logic not S (1's comp)
         4'b1100: {C,Y} = 0-S;          // negate S (2's comp)
         default: {C,Y} = {1'b0,S};     // pass S for default
      endcase

   // handle last two status flags
   N = Y[15];
   if (Y == 16'b0)
      Z = 1'b1;
   else
      Z = 1'b0;
      
   end // end always
endmodule 
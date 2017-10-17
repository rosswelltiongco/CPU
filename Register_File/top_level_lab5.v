`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: top_level_lab5.v
 * Date:     
 * Version:  1.0
 *
 * Description: 
 *
 *
 * Work Time: 30 mins - Jesus
 * Debug Time:
 *******************************************************************************/
module top_level_lab5(clk, reset, we, W, W_Adr, R_Adr, S_Adr, R, S, anode[7:0], a, b, c, d, e, f, g );
   //Declare inputs
   input clk, reset, we;
   input [3:0] W;
   input [2:0] W_Adr, R_Adr, S_Adr;
   
   //Declare outputs
   output [15:0] R, S;
   output [7:0] anode;
   output a, b, c, d, e, f, g;
   
   //Declare wires
         //wires for Wdec decoder
   wire  w7, w6, w5, w4, w3, w2, w1, w0;
         //wires for Rdec decoder
   wire  r7, r6, r5, r4, r3, r2, r1, r0;
         //wires for Sdec decoder
   wire  s7, s6, s5, s4, s3, s2, s1, s0;
   
   wire [15:0] R, S;
   
   //Declare decoders
   //    decoder3to8( In, en, y7, y6, y5, y4, y3, y2, y1, y0 );
   decoder3to8 Wdec (W_Adr,   we, w7, w6, w5, w4, w3, w2, w1, w0);
   decoder3to8 Rdec (R_Adr, 1'b1, r7, r6, r5, r4, r3, r2, r1, r0);
   decoder3to8 Sdec (S_Adr, 1'b1, s7, s6, s5, s4, s3, s2, s1, s0);
   
   //Declare Reg16
   // reg16(clk, reset, ld,           Din, DA, DB, oeA, oeB);
   reg16 R7(clk, reset, w7, {12'hFFF,  W}, R,   S, r7, s7);
   reg16 R6(clk, reset, w6, {12'hFFF,  W}, R,   S, r6, s6);
   reg16 R5(clk, reset, w5, {12'hFFF,  W}, R,   S, r5, s5);
   reg16 R4(clk, reset, w4, {12'hFFF,  W}, R,   S, r4, s4);
   reg16 R3(clk, reset, w3, {12'hFFF,  W}, R,   S, r3, s3);
   reg16 R2(clk, reset, w2, {12'hFFF,  W}, R,   S, r2, s2);
   reg16 R1(clk, reset, w1, {12'hFFF,  W}, R,   S, r1, s1);
   reg16 R0(clk, reset, w0, {12'hFFF,  W}, R,   S, r0, s0);
   
   //Display_Controller(clk,reset,seg7,seg6,seg5,seg4,seg3,seg2,seg1,seg0,A7,A6,A5,A4,A3,A2,A1,A0,a,b,c,d,e,f,g);
   Display_Controller main(      clk,    reset, 
                            R[15:12],  R[11:8],   R[7:4],   R[3:0], 
                            S[15:12],  S[11:8],   S[7:4],   S[3:0], 
                            anode[7], anode[6], anode[5], anode[4], anode[3], anode[2], anode[1], anode[0],
                                   a,        b,        c,        d,        e,        f,        g);
   
endmodule

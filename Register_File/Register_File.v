`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: Register_File.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: Decoders used to enable 8 instances of a 16-bit register
 * that can be read or written to. Outputs 2 16 bit values from registers.
 * Output is chosen based on tri state logic using instantiation of 3to8 
 * decoders
 *
 *******************************************************************************/
module Register_File(clk, reset, W_Adr, we, R_Adr, S_Adr, W, R, S);
   //Declare inputs
	input           clk, reset,    we;
	input  [2:0]  W_Adr, R_Adr, S_Adr;
	input  [15:0]     W              ;
   
   //Declare outputs
	output [15:0]     R,     S       ;
	
   //Wdec decoder wires
   wire  w7, w6, w5, w4, w3, w2, w1, w0;
   //Rdec decoder wires
   wire  r7, r6, r5, r4, r3, r2, r1, r0;
   //Sdec decoder wires
   wire  s7, s6, s5, s4, s3, s2, s1, s0;
 
	//Instantiating 3 instances of 3t o 8 decoders
   //decoder3to8    (In,      en, y7, y6, y5, y4, y3, y2, y1, y0);
   decoder3to8 Wdec (W_Adr,   we, w7, w6, w5, w4, w3, w2, w1, w0),
               Rdec (R_Adr, 1'b1, r7, r6, r5, r4, r3, r2, r1, r0),
               Sdec (S_Adr, 1'b1, s7, s6, s5, s4, s3, s2, s1, s0);
   
   //Instantiating 8 instances of reg16
   //reg16 (clk, reset, ld, Din, DA, DB, oeA, oeB);
   reg16 R7(clk, reset, w7,   W,  R,  S,  r7,  s7),
			R6(clk, reset, w6,   W,  R,  S,  r6,  s6),
			R5(clk, reset, w5,   W,  R,  S,  r5,  s5),
			R4(clk, reset, w4,   W,  R,  S,  r4,  s4),
			R3(clk, reset, w3,   W,  R,  S,  r3,  s3),
			R2(clk, reset, w2,   W,  R,  S,  r2,  s2),
			R1(clk, reset, w1,   W,  R,  S,  r1,  s1),
			R0(clk, reset, w0,   W,  R,  S,  r0,  s0);

endmodule

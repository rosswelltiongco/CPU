`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: top_level_lab5.v
 * Date:     
 * Version:  1.0
 *
 * Description: Reading inputs stored in a register to a 7segment display. Data
 *              can be written to the registers but not at the same time.
 *
 *
 * Work Time: 45 mins - Jesus w/ .ucf file
 * Debug Time: 15 mins - Jesus
 *******************************************************************************/
module top_level_lab5(clk, reset, we, W, W_Adr, R_Adr, S_Adr, anode[7:0], 
                      a, b, c, d, e, f, g );
   //Declare inputs
   input clk, reset, we;
   input [3:0] W;
   input [2:0] W_Adr, R_Adr, S_Adr;
   
   //Declare outputs
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
   
   wire we_one_shot;
   
   
   //write enable debouncer
 //one_shot            ( clk_in, reset, Din, Dout       );
   one_shot we_debounce( clk   , reset, we , we_one_shot);
   
 //Register_File         (clk, reset, W_Adr,          we, R_Adr, S_Adr, W, R, S);
   Register_File reg_file(clk, reset, W_Adr, we_one_shot, R_Adr, S_Adr, W, R, S);
   
 //Display_Controller     (      clk,    reset,
   Display_Controller main(      clk,    reset, 
   //                           seg7,     seg6,     seg5,     seg4,
                            R[15:12],  R[11:8],   R[7:4],   R[3:0], 
                            //  seg3,     seg2,     seg1,     seg0,
                            S[15:12],  S[11:8],   S[7:4],   S[3:0], 
                            //    A7,       A6,       A5,       A4
                            anode[7], anode[6], anode[5], anode[4],
                            //    A3,       A2,       A1,        A0
                            anode[3], anode[2], anode[1], anode[0],
                            //     a,        b,        c,        d
                                   a,        b,        c,        d,
                            //     e,        f,        g         );
                                   e,        f,        g         );
   
endmodule

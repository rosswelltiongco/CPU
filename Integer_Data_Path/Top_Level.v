`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: Top_Level.v
 * Date:     November 6, 2017
 * Version:  1.0
 *
 * Description: Top level module implements an Integer Data Path whose output 
 * is shown on 8 seven segment displays. The top level instantiates a module
 * with a 13 function arithmetic logic unit that takes either a constant input, 
 * or a value from an instantiated register file. One of the 2 outputs of the 
 * register file is displayed on 4 of the Nexys4's 7 segment displays. The
 * outputs of the ALU is displayed on the other 4 segments. The module also
 * outputs the ALU's flags of (C) Carry, (N) Negative and (Z) Zero to the
 * Nexys4's rightmost LEDs above the switches.
 *
 *******************************************************************************/
module Top_Level(clk, reset, W_Adr, R_Adr, S_Adr, Alu_Op, S_Sel, reg_step,
                 C, N, Z, anode, segs );
                 
   //declare inputs
   input          clk, reset, S_Sel, reg_step;
   input [2:0]  W_Adr, R_Adr, S_Adr;
   input [3:0] Alu_Op;
   
   //declare outputs
   output  C, N, Z; // will be LSB leds in this order
   //display outputs
   output [7:0] anode;
   output [6:0]  segs;
   
   //declare wires
   wire        regclk_out;
   wire [15:0]    Reg_out, Alu_out;

   //     debounce(clk, reset,      Din,       Dout);
   debounce regclk(clk, reset, reg_step, regclk_out);
   
   //   IDP(       clk, W_En, W_Adr,   S_Adr,   R_Adr,       DS, S_Sel, 
   IDP main(regclk_out, 1'b1, W_Adr,   S_Adr,   R_Adr, 16'hAA55, S_Sel, 
   //       ALU_OP, reset,    C,     N,     Z, Reg_Out, Alu_out       );
            Alu_Op, reset,    C,     N,     Z, Reg_out, Alu_out       );


   //Display_Controller 
   Display_Controller disp 
   //(clk,     reset, 
     (clk,     reset,
   // seg7,          seg6,         seg5,         seg4, 
      Reg_out[15:12], Reg_out[11:8], Reg_out[7:4], Reg_out[3:0],
   // seg3,          seg2,         seg1,         seg0,                       
      Alu_out[15:12], Alu_out[11:8], Alu_out[7:4], Alu_out[3:0],
   // A7,       A6,       A5,       A4,       
      anode[7], anode[6], anode[5], anode[4], 
   // A3,       A2,       A1,       A0,   
      anode[3], anode[2], anode[1], anode[0], 
   //       a,       b,       c,       d,       e,       f,       g);
      segs[6], segs[5], segs[4], segs[3], segs[2], segs[1], segs[0]); 

endmodule

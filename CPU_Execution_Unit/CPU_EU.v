`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: 
 * Date:     
 * Version:  1.0
 *
 * Description: 
 *
 *
 * Work  Time: 45 mins Jesus 11/9 30 mins 11/22 
 * Debug Time: 
 *******************************************************************************/
module CPU_EU(clk, w_en, s_sel, reset, pc_ld, pc_inc, ir_ld, adr_sel, D_in, Address, D_out, C, N, Z);


   //declare inputs
   input clk, reset, w_en, s_sel, adr_sel, pc_ld, pc_inc, ir_ld; 
   input [15:0] D_in;
   
   //Din[15:12], Din[11:9], Din[8:6], Din[5:3], Din[2:0]
   //1011_           000_      001_      000_      000 <- RTL microperation
   //alu_op,         xxx,      dest,      R,        S
   
   //declare outputs
   output [15:0] Address;
   output wire [15:0] D_out;
   output C, N, Z;
   
   //declare wires
   wire [15:0] ir_out, pc_out, reg_out;
   

   //IDP    (clk, W_En,       W_Adr,       S_Adr,       R_Adr,   DS, S_Sel,        ALU_OP, reset, C, N, Z, Reg_Out, Alu_out);
   IDP  idp (clk, w_en, ir_out[8:6], ir_out[2:0], ir_out[5:3], D_in, s_sel, ir_out[15:12], reset, C, N, Z, reg_out,   D_out);
   
   //reg16_L_Inc (clk, reset,    ld,    inc,       D,      q);
   reg16_L_Inc PC(clk, reset, pc_ld, pc_inc,   D_out, pc_out);
   
   //reg16_L_Inc (clk, reset,    ld,  inc,    D,      q);
   reg16_L_Inc IR(clk, reset, ir_ld, 1'b0, D_in, ir_out);

   assign Address = adr_sel ? reg_out : pc_out;

endmodule

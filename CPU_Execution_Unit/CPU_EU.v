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
 * Work  Time: 45 mins Jesus 11/9
 * Debug Time: 
 *******************************************************************************/
module CPU_EU(clk, reset,W_En, pc_ld, adr_sel, Din, S_Sel, pc_inc, reg_w_en, ir_ld);
   //declare inputs
   input clk, W_En, reset, S_Sel, adr_sel, pc_ld, pc_inc, reg_w_en, ir_ld; 
   
   input [15:0] Din;
   //Din[15:12], Din[11:9], Din[8:6], Din[5:3], Din[2:0]
   //1011_           000_      001_      000_      000 <- RTL microperation
   //alu_op,         xxx,      dest,      R,        S
   
   //declare outputs

   
   //declare wires
   

   //IDP    (clk,     W_En, W_Adr, S_Adr, R_Adr, DS, S_Sel, ALU_OP, reset, C, N, Z, Reg_Out, Alu_out);
   IDP main (clk, reg_w_en, W_Adr, S_Adr, R_Adr, DS, S_Sel, ALU_OP, reset, C, N, Z, reg_out, Alu_out);

   
   //reg16_L_Inc (clk, reset,    ld,    inc,       D,      q);
   reg16_L_Inc PC(clk, reset, pc_ld, pc_inc, Alu_out, PC_out);
   
   //reg16_L_Inc (clk, reset,    ld,  inc,    D,      q);
   reg16_L_Inc IR(clk, reset, ir_ld, 1'b0, D_in, IR_out);

   assign Address = adr_sel ? reg_out : PC_out;

endmodule

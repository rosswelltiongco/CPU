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
module CPU_EU(clk, reset, reg_w_en, S_Sel, adr_sel, pc_ld, pc_inc, ir_ld, D_in, C, N, Z, Address, D_out);

   //declare inputs
   input clk, reset, reg_w_en, S_Sel, adr_sel, pc_ld, pc_inc, ir_ld; 
   input [15:0] D_in;
   
   //Din[15:12], Din[11:9], Din[8:6], Din[5:3], Din[2:0]
   //1011_           000_      001_      000_      000 <- RTL microperation
   //alu_op,         xxx,      dest,      R,        S
   
   //declare outputs
   output C, N, Z; //Flags indicated by LEDs
   output [15:0] Address, D_out;
   
   //declare wires
   wire [2:0] W_Adr, S_Adr, R_Adr;
   wire [3:0] ALU_OP;
   wire [15:0] IR_Out, PC_Out, Reg_Out, Alu_Out;
   

   //IDP    (clk,    W_En, W_Adr, S_Adr, R_Adr,   DS, S_Sel, ALU_OP, reset, C, N, Z, Reg_Out, Alu_out);
   IDP  idp (clk, reg_w_en, W_Adr, S_Adr, R_Adr, D_in, S_Sel, ALU_OP, reset, C, N, Z, Reg_Out, Alu_Out);

   
   //reg16_L_Inc (clk, reset,    ld,    inc,       D,      q);
   reg16_L_Inc PC(clk, reset, pc_ld, pc_inc, Alu_Out, PC_Out);
   
   //reg16_L_Inc (clk, reset,    ld,  inc,    D,      q);
   reg16_L_Inc IR(clk, reset, ir_ld, 1'b0, D_in, IR_Out);

   assign Address = adr_sel ? Reg_Out: PC_Out;

endmodule

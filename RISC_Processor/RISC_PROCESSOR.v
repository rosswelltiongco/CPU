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
 * Work  Time: 
 * Debug Time: 
 *******************************************************************************/
module RISC_PROCESSOR(clk, reset, D_in, mw_en, status, Address, D_out);
   //inputs
   input        clk, reset; 
   input [15:0] D_in;
   
   //outputs
   output      mw_en;
   output [7:0] status;//status LEDs
   output [15:0] Address, D_out;
   
   //wires
   wire [15:0] IR_out;
   wire [3:0]  alu_op;
   wire [2:0]  w_adr, r_adr, s_adr, ALU_status;
   wire        adr_sel, s_sel, pc_ld, pc_inc, pc_sel, ir_ld, rw_en;

//module cu       (clk, reset,     IR,             N,             Z,             C, W_Adr, R_Adr, S_Adr, adr_sel, s_sel, pc_ld, pc_Inc, pc_sel, ir_ld, mw_en, rw_en, alu_op, status);
   cu control_unit(clk, reset, IR_out, ALU_status[2], ALU_status[1], ALU_status[0], w_adr, r_adr, s_adr, adr_sel, s_sel, pc_ld, pc_inc, pc_sel, ir_ld, mw_en, rw_en, alu_op, status);
   
//module CPU_EU   (clk, rw_en, s_sel, reset, pc_ld, pc_inc, ir_ld, adr_sel, pc_sel, D_in, Address, D_out,             C,             N,             Z);
   CPU_EU  ex_unit(clk, rw_en, s_sel, reset, pc_ld, pc_inc, ir_ld, adr_sel, pc_sel, D_in, Address, D_out, ALU_status[0], ALU_status[1], ALU_status[2]);
endmodule

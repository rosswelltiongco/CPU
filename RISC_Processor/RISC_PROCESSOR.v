`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: RISC_PROCESSOR.v
 * Date:     December 6, 2017
 * Version:  1.0
 *
 * Description: RISC processor module instantiates and connects control unit
 * with the execution unit. The control unit, which is a finite state machine,
 * sends control signals to the execution unit based on its current state.
 *
 *******************************************************************************/
module RISC_PROCESSOR(clk, reset, D_in, mw_en, status, Address, D_out);
   
   //inputs
   input         clk, reset; 
   input [15:0]  D_in;
   
   //outputs
   output        mw_en;
   output [7:0]  status;//status LEDs
   output [15:0] Address, D_out;
   
   //wires
   wire [15:0] IR_out;
   wire [3:0]  alu_op;
   wire [2:0]  w_adr, r_adr, s_adr;
   wire        adr_sel, s_sel, pc_ld, pc_inc, pc_sel, ir_ld, rw_en, N, Z, C;
   
   //           cu(clk, reset,     IR, N, Z, C, W_Adr, R_Adr, S_Adr, adr_sel,
   cu control_unit(clk, reset, IR_out, N, Z, C, w_adr, r_adr, s_adr, adr_sel, 
   // s_sel, pc_ld, pc_Inc, pc_sel, ir_ld, mw_en, rw_en, alu_op, status);
      s_sel, pc_ld, pc_inc, pc_sel, ir_ld, mw_en, rw_en, alu_op, status);
   
   //       CPU_EU(clk, rw_en, s_sel, reset, pc_ld, pc_inc, ir_ld, adr_sel, 
   CPU_EU  ex_unit(clk, rw_en, s_sel, reset, pc_ld, pc_inc, ir_ld, adr_sel, 
   // pc_sel, D_in, Address, D_out, C, N, Z, W_Adr, R_Adr, S_Adr, ALU_OP, ir_out);
      pc_sel, D_in, Address, D_out, C, N, Z, w_adr, r_adr, s_adr, alu_op, IR_out);
      
endmodule

`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: CPU_EU.v
 * Date:     November 27, 2017
 * Version:  1.0
 *
 * Description: Execution unit instantiates and connects our Integer Data Path
 * module as well as 2 additional registers, the Program Counter and 
 * Instruction Register. The Instruction register's output is connected as a 
 * control word for the Integer Datapath's Register File.
 *
 *******************************************************************************/
module CPU_EU(clk, w_en, s_sel, reset, pc_ld, pc_inc, ir_ld, adr_sel, pc_sel,
              D_in, Address, D_out, C, N, Z);


   //declare inputs
   input clk, reset, w_en, s_sel, adr_sel, pc_ld, pc_inc, ir_ld, pc_sel; 
   input [15:0] D_in;
   
   //declare outputs
   output [15:0] Address;
   output [15:0] D_out;
   output C, N, Z;
   
   //declare wires
   wire [15:0] ir_out, pc_out, reg_out;
   wire pc_mux;
   

   //IDP    (clk, W_En,       W_Adr,       S_Adr,       R_Adr,   DS, S_Sel,
   IDP  idp (clk, w_en, ir_out[8:6], ir_out[2:0], ir_out[5:3], D_in, s_sel,
   //               ALU_OP, reset, C, N, Z, Reg_Out, Alu_out);
             ir_out[15:12], reset, C, N, Z, reg_out,   D_out);
   
   
   //reg16_L_Inc (clk, reset,    ld,    inc,        D,      q);
   reg16_L_Inc PC(clk, reset, pc_ld, pc_inc,   pc_mux, pc_out);
   
   //reg16_L_Inc (clk, reset,    ld,  inc,    D,      q);
   reg16_L_Inc IR(clk, reset, ir_ld, 1'b0, D_in, ir_out);
   
   //sign extention
   assign sign_ext = {{8{ir_out[7]}},ir_out};
   //16 bit adder
   assign branch_address = pc_out + sign_ext;
   
   assign Address = adr_sel ? reg_out : pc_out;
   assign pc_mux = pc_sel ? D_out : branch_address;

endmodule

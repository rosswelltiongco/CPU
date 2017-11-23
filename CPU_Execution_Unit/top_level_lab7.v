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
<<<<<<< HEAD
module top_level_lab7(clk, reset, s_sel, pc_ld, pc_inc, ir_ld, step_clk, mem_w_en, 
                     adr_sel, reg_w_en, C, N, Z, a,  b,  c,  d,  e,  f,  g, an );

   //input 
   input clk, reset, s_sel, pc_ld, pc_inc, ir_ld, step_clk, mem_w_en, adr_sel, reg_w_en;
   
   //output
   output C, N, Z, a,  b,  c,  d,  e,  f,  g;
   output [7:0] an;
   //wire
   wire [15:0] address, eu_d_out;
   
   //CPU_EU
   //IDP shares input with IR
   //             CPU_EU(         clk,     w_en, s_sel, reset, pc_ld, pc_inc, ir_ld, adr_sel,      D_in, Address,    D_out,  C, N, Z);
   CPU_EU execution_unit(step_clk_out, reg_w_en, s_sel, reset, pc_ld, pc_inc, ir_ld, adr_sel, mem_d_out, address, eu_d_out,  C, N, Z);
=======
module top_level_lab7(clk, reset, step_clk, adr_sel, mem_w_en, reg_w_en, S_Sel, pc_ld, pc_inc, ir_ld, 
                      anode, a, b, c, d, e, f, g, C, N, Z);

   //inputs
   input clk, reset, step_clk, adr_sel, mem_w_en, reg_w_en, S_Sel, pc_ld, pc_inc, ir_ld;
   
   //outputs
   output C, N, Z;
   output a, b, c, d, e, f, g;
   output [7:0] anode;
   
   //wires
   wire step_clk_out, w_en_out;
   //wire [15:0] RAM_Out, CE_Out, CE_Adr
   wire [15:0] mem_d_out, eu_d_out, address;
>>>>>>> 776a75946ec34f92c3a9b958667c860f23f47272
   
   //debounce   (clk, reset,      Din,         Dout);
   debounce step(clk, reset, step_clk, step_clk_out);
   
<<<<<<< HEAD
   //debounce           (clk, reset,      Din,         Dout);
   debounce mem_w_enable(clk, reset, mem_w_en, mem_w_en_out);
   
   //ram7          (clk,           we,    addr,      din,      dout);
=======
   
   //debounce               (clk, reset,      Din, Dout);
   debounce mem_write_enable(clk, reset, mem_w_en, w_en_out);
   
   
   //CPU_EU
   //IDP shares input with IR
   //                   (clk,          reset, W_En, S_Sel, adr_sel, pc_ld, pc_inc, ir_ld, D_in     , C, N, Z, Address, D_out);
   CPU_EU execution_unit(step_clk_out, reset, W_En, S_Sel, adr_sel, pc_ld, pc_inc, ir_ld, mem_d_out, C, N, Z, address, eu_d_out);
   
   
   //ram7          (clk,           we,    addr,      din,  dout);
>>>>>>> 776a75946ec34f92c3a9b958667c860f23f47272
   ram7 main_memory(clk, mem_w_en_out, address, eu_d_out, mem_d_out);


   //Display_Controller   (clk, reset, 
   Display_Controller disp(clk, reset,
   //           seg7,          seg6,         seg5,         seg4, 
      address[15:12], address[11:8], address[7:4], address[3:0],
   //            seg3,           seg2,          seg1,          seg0, 
      eu_d_out[15:12], eu_d_out[11:8], eu_d_out[7:4], eu_d_out[3:0],
   //    A7,   A6,   A5,   A4,   A3,   A2,   A1,   A0, 
      an[7], an[6], an[5], an[4], 
      an[3], an[2], an[1], an[0],
   // a, b, c, d, e, f, g);
      a, b, c, d, e, f, g);
endmodule

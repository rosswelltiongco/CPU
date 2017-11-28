`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: top_level_lab7.v
 * Date:     November 27, 2017
 * Version:  1.0
 *
 * Description: Top level module instantiates and connection the Execution Unit
 * module, ram module and Display Controller.
 *
 *******************************************************************************/
module top_level_lab7(clk, reset, s_sel, pc_ld, pc_inc, ir_ld, step_clk, 
                      mem_w_en, adr_sel, reg_w_en, C, N, Z, 
                      a,  b,  c,  d,  e,  f,  g, an );
   //inputs 
   input clk, reset, s_sel, pc_ld, pc_inc, ir_ld, 
         step_clk, mem_w_en, adr_sel, reg_w_en;
   
   //outputs
   output C, N, Z, a,  b,  c,  d,  e,  f,  g;
   output [7:0] an;
   
   //wire
   wire [15:0] address, eu_d_out, mem_d_out;
   wire step_clk_out, mem_w_en_out;

   //             CPU_EU(         clk,     w_en, s_sel, reset, pc_ld, pc_inc, 
   CPU_EU execution_unit(step_clk_out, reg_w_en, s_sel, reset, pc_ld, pc_inc,
   //                    ir_ld, adr_sel,      D_in, Address,    D_out,  C, N, Z);
                         ir_ld, adr_sel, mem_d_out, address, eu_d_out,  C, N, Z);

   //debounce   (clk, reset,      Din,         Dout);
   debounce step(clk, reset, step_clk, step_clk_out);
   
   //debounce           (clk, reset,      Din,         Dout);
   debounce mem_w_enable(clk, reset, mem_w_en, mem_w_en_out);
   
   //ram7          (clk,           we,         addr,      din,      dout);
   ram7 main_memory(clk, mem_w_en_out, address[7:0], eu_d_out, mem_d_out);


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

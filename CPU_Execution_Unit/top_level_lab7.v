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
module top_level_lab7();

   //CPU_EU
   //IDP shoares input with IR
   CPU_EU execution_unit();
   
   //debounce   (clk, reset,      Din,         Dout);
   debounce step(clk, reset, step_clk, step_clk_out);
   
   //debounce               (clk, reset,      Din,         Dout);
   debounce mem_write_enable(clk, reset, mem_w_en, mem_w_en_out);
   
   //ram7          (clk,           we,    addr,  din,  dout);
   ram7 main_memory(clk, mem_w_en_out, address, eu_d_out, mem_d_out);

   //Display_Controller   (clk, reset, 
   Display_Controller disp(clk, reset,
   //           seg7,          seg6,         seg5,         seg4, 
      address[15:12], address[11:8], address[7:4], address[3:0],
   //            seg3,           seg2,          seg1,          seg0, 
      eu_d_out[15:12], eu_d_out[11:8], eu_d_out[7:4], eu_d_out[3:0],
   //    A7,   A6,   A5,   A4,   A3,   A2,   A1,   A0, 
      anode[7], anode[6], anode[5], anode[4], 
      anode[3], anode[2], anode[1], anode[0],
   // a, b, c, d, e, f, g);
      a, b, c, d, e, f, g);
endmodule

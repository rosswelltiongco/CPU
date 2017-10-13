`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco
 * Email:    rosswelltiongco@gmail.com
 * Filename: top_level_all.v
 * Date:     
 * Version:  
 *
 * Description:     
 *
 *
 *******************************************************************************/
module top_level_all(clk, reset,a7,a6,a5,a4,a3,a2,a1,a0
    );
   input addr_step;
  
   wire   clk_out;
   wire addr_step;
   wire  addr_out;
   
   
   //clk_500Hz          ( clk_in, reset, clk_out );
     clk_500Hz clk_clk1 ( clk   , reset, clk_out );
     
   //pixel_clk        ( clk_in, reset,    clk_out );
     pixel_clk px_clk ( clk   , reset,     px_out );
     
   //one_shot                ( clk_in , reset,        Din,      Dout);
     one_shot   addr_oneshot ( clk_out, reset,  addr_step, addr_shot);
     
   //addr_seq           (clk      , rst, addr    );
     addr_seq   add_seq (addr_shot, rst, addr_out);
     
          //FIXME: Overwrap iminent
   //pixel_controller    (  clk_480Hz, reset, a7, a6, a5, a4, a3, a2, a1, a0, seg_sel);
     pixel_controller pc (     px_out, reset, a7, a6, a5, a4, a3, a2, a1, a0, seg_sel);
   
   //ram       (    clk,        we, addr, din, dout);
     ram  ram1 (clk, addr_step, we, addr_out, din, dout);
   
   //ad_mux(d7, d6, d5, d4, d3, d2, d1, d0, sel, Y);
     ad_mux am0(d7, d6, d5, d4, d3, d2, d1, d0, seg_sel, ad_out);
   
   //hexto7segment(Q, disp);
     hexto7segment  hex0(ad_out, disp);



endmodule

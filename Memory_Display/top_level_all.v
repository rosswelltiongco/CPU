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
module top_level_all(clk,rst,addr_step,we_step,din,a7,a6,a5,a4,a3,a2,a1,a0,disp
    );
   input clk, rst;
   input addr_step, we_step;
   input [15:0] din;
   
   
   output a7, a6, a5, a4, a3, a2, a1, a0;
   output [6:0] disp;
   
   wire mux_out;
  
   wire   clk_out;
   wire px_out;
   wire addr_shot;
   wire [2:0] seg_sel;
   wire  we_shot;
   wire [7:0] addr_out;
   wire [15:0] dout;
   
   
   //clk_500Hz          ( clk_in, reset, clk_out );
     clk_500Hz clk_clk1 ( clk   , reset, clk_out );
     
   //pixel_clk        ( clk_in, reset,    clk_out );
     pixel_clk px_clk ( clk   , reset,     px_out );
     
   //one_shot                ( clk_in , reset,        Din,      Dout);
     one_shot   addr_oneshot ( clk_out, reset,  addr_step, addr_shot);
     
     //one_shot                ( clk_in , reset,        Din,      Dout);
     one_shot   we_oneshot ( clk_out, reset,  we_step, we_shot);
     
   //addr_seq           (clk      , rst, addr    );
     addr_seq   add_seq (addr_shot, rst, addr_out);
     
          //FIXME: Overwrap iminent
   //pixel_controller    (  clk_480Hz, reset, a7, a6, a5, a4, a3, a2, a1, a0, seg_sel);
     pixel_controller pc (     px_out, reset, a7, a6, a5, a4, a3, a2, a1, a0, seg_sel);
   
   //ram       (    clk,        we, addr, din, dout);
     ram  ram1 (clk, addr_step, we_shot, addr_out, din, dout);
   
   //ad_mux(d7, d6, d5, d4, d3, d2, d1, d0, sel, Y);
     ad_mux am0({4'h0}, {4'h0}, addr_out[7:4], addr_out[3:0], dout[15:12], dout[11:8], dout[7:4], dout[3:0], seg_sel, mux_out);
   
   //hexto7segment(Q, disp);
     hexto7segment  hex0(mux_out, disp);



endmodule

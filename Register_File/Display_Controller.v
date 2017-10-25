`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: Display_Controller.v
 * Date:     October 25, 2017
 * Version:  1.0
 *
 * Description: Outputs 8 4-bit values to 8 different seven segment displays
 * at a refresh rate of 60Hz
 *
 *******************************************************************************/
module Display_Controller(clk, reset, 
                          seg7, seg6, seg5, seg4, seg3, seg2, seg1, seg0, 
                            A7,   A6,   A5,   A4,   A3,   A2,   A1,   A0, 
                             a,    b,    c,    d,    e,    f,    g);
   //Declare inputs
   input       clk, reset;
   input [3:0] seg7, seg6, seg5, seg4, seg3, seg2, seg1, seg0;
   
   
   //Declare output
   output A7, A6, A5, A4, A3, A2, A1, A0,
           a,  b,  c,  d,  e,  f,  g;
   
   //Declare Wire
   wire pixel_clk_out;
   wire [2:0] seg_sel;
   wire [3:0] hex;
   
   //Declare modules
   
   //pixel_clk  (clk_in, reset, clk_out      );
   pixel_clk pxl(   clk, reset, pixel_clk_out);
   
   //pixel_controller           (clk_480Hz    , reset, 
   pixel_controller main_control(pixel_clk_out, reset, 
                               //a7, a6, a5, a4, a3, a2, a1, a0, seg_sel);
                                 A7, A6, A5, A4, A3, A2, A1, A0, seg_sel);
   
   
   //ad_mux      (d7  , d6  , d5  , d4  , d3  , d2  , d1  , d0  , sel    , Y  );
   ad_mux mux8to1(seg7, seg6, seg5, seg4, seg3, seg2, seg1, seg0, seg_sel, hex);
   
   
   //hexto7segment      (Q   , disp                 );
   hexto7segment decoder( hex, {a, b, c, d, e, f, g});
   
   
endmodule

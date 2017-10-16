`timescale 1ns / 1ps
/********************************************************************************
 *
 * Author:   Rosswell Tiongco & Jesus Luciano
 * Email:    rosswelltiongco@gmail.com & jlucian995@gmail.com
 * Filename: top_level_all.v
 * Date:     October 16, 2017
 * Version:  2.0
 *
 * Description: Displays a location in memory onto the target machine.
 * Additionally, the location in memory's corresponding value can be
 * read and overwritten
 *
 *******************************************************************************/
module top_level_all(clk ,rst ,addr_step ,we_step ,din ,a7 ,a6 ,a5 ,a4 ,a3 ,a2 ,
                     a1  , a0 ,disp );
 //Inputs
   input clk, rst, addr_step, we_step;
   input [15:0] din;
	
 //Outputs
   output a7, a6, a5, a4, a3, a2, a1, a0;
   output [6:0] disp;
  
 //Wires
   wire clk_out, px_out, addr_shot, we_shot;
	wire [3:0] mux_out;
   wire [2:0] seg_sel;
	wire [7:0] addr_out;
	wire [15:0] dout;
   
   
 //clk_500Hz            ( clk_in, reset, clk_out );
	clk_500Hz   clk_clk1 ( clk   , rst  , clk_out );
     
 //pixel_clk          ( clk_in, reset, clk_out );
	pixel_clk   px_clk ( clk   , rst  , px_out  );
     
 //one_shot                 ( clk_in , reset, Din      , Dout     );
	one_shot    addr_oneshot ( clk_out, rst  , addr_step, addr_shot);
     
 //one_shot               ( clk_in , reset, Din    , Dout   );
	one_shot    we_oneshot ( clk_out, rst  , we_step, we_shot);
     
 //addr_seq            ( clk      , rst, addr    );
	addr_seq    add_seq ( addr_shot, rst, addr_out);
     
 //pixel_controller    ( clk_480Hz, reset, a7, a6, a5, a4, a3, a2, a1, a0, seg_sel);
	pixel_controller pc ( px_out   , rst  , a7, a6, a5, a4, a3, a2, a1, a0, seg_sel);

 //ram1       (clk, we     , addr    , din, dout);
	ram1   ram (clk, we_shot, addr_out, din, dout);

 //ad_mux    ( d7   ,  d6   , d5           , d4           , d3         , 
	ad_mux am0({4'h0}, {4'h0}, addr_out[7:4], addr_out[3:0], dout[15:12], 
 //           d2        , d1       , d0       , sel    , Y      );
              dout[11:8], dout[7:4], dout[3:0], seg_sel, mux_out);
 
 //hexto7segment      ( Q      , disp );
	hexto7segment  hex0( mux_out, disp );

endmodule
